local skynet = require "skynet"
local config = require "config.testConfig"
local logger = require "common.log.skynetlog"


skynet.start(function()
	log = logger.create("testServer2",logger.level.debug)
    log.info("start testServer2")


    local mygate = skynet.newservice("mygate")
    skynet.call(mygate, "lua", "open", {
        port = config.testServer2.port,
        maxclient = 10000,
        nodelay = true,
    })

    local test1 = skynet.newservice("test1")
    --skynet.call(test1, "lua", "start")

    skynet.exit()
end)
