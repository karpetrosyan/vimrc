import trio


async def foo():
    with trio.fail_after(2):
        ...


