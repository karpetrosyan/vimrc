FROM alpine:latest

ENV CXX=clang++ CC=clang
RUN apk update \
    && apk add --update \
    	# General
        neovim \
	git \
	# For python lsp
	python3 \
	python3-dev \
	py3-pip \
	# For telescope
	ripgrep \
	fd \
	# For lsp installer
	unzip \
	wget \
	gzip \
	bash \
	ca-certificates \
	curl \
	libstdc++ \
	clang \
	build-base \
	nodejs \
	npm \
    && ln -sf python3 /usr/bin/python \
    && rm -rf /var/cache/apk/*

COPY nvim /root/.config/nvim

ENTRYPOINT ["/bin/sh"]
