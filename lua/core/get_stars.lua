local function get_github()
    local stream = io.popen("git remote -v", "r")
    local acc_name, repo_name

    for line in stream:lines() do
        _, url, _ = string.match(line, "(%g+).(%g+) (%g+)")
        if string.find(url, "git@") then
            acc_name, repo_name = string.match(url, ":(.*)/(.*)")
        else
            acc_name, repo_name = string.match(url, "github.com/(.*)/(.*)")
        end

        if acc_name and repo_name then
            break
        end
    end

    if acc_name and repo_name then
	return {acc_name=acc_name, repo_name=repo_name}
    end
end


local function get_repo_stats(url)
    local stream = io.popen(string.format("curl --silent %s", url))

    json = stream:read("*a")

    stars = string.match(json, '"stargazers_count": (%d+)')
    forks = string.match(json, '"forks_count": (%d+)')
    tags_url = string.match(json, '"tags_url": "(https://.-)"')
    
    local tag_stream = io.popen(string.format("curl --silent %s", tags_url))

    json = tag_stream:read("*a")

    tag = string.match(json, '"name": "(%S+)"')

    return {tag=tag, stars = stars, forks = forks}
end

local function update_github_widget(buf)
    local git = get_github()

    if not git then
	return	   
    end
    
    url = string.format("https://api.github.com/repos/%s/%s", git.acc_name, git.repo_name)
	
    status = get_repo_stats(url)
    
    if status.forks and status.stars then
	vim.api.nvim_buf_set_lines(buf, 0, -1, false, {string.format(" 🌟 %s  %s v%s", status.stars, status.forks, status.tag)})
    end
end

local function set_github_widget()
    local git = get_github()
    local buf = vim.api.nvim_create_buf(false, false)
    local win =
        vim.api.nvim_open_win(
        buf,
        false,
        {
            relative = "mouse",
            anchor = "NE",
            row = 0,
            col = 2000,
            width = 30,
            height = 2,
            border = "single",
            fixed = true,
            focusable = false,
            style = "minimal",
            title = "GitHub",
            title_pos = "center"
        }
    )

    vim.api.nvim_buf_set_option(buf, "buftype", "nofile")
    vim.api.nvim_win_call(
        win,
        function()
            vim.opt.number = false
            vim.opt.relativenumber = false
        end
    )
    if git then
	local timer = vim.uv.new_timer()
	timer:start(
	    1000,
	    1200000,
	    vim.schedule_wrap(
		function()
		    function call_update()
			update_github_widget(buf)
		    end
		    call_update()
		end
	    )
	)
    else 
	vim.api.nvim_buf_set_lines(buf, 0, -1, false, {".git directory was not found"}) 
    end
end


vim.api.nvim_create_user_command("ShowRepo", set_github_widget, {})

