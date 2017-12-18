local skynet = require "skynet"
require "skynet.manager"
local cluster = require "cluster"
local config = require "config.testServerConfig"
local logger = require "common.log.skynetlog"
local harbor = require "skynet.harbor"


skynet.start(function()
	log = logger.create("testserver15s1",logger.level.debug)
    log.info("start testserver15s1")

 
    local test1 = skynet.newservice("test1")
    skynet.name("test1", test1)
    skynet.call("test1","lua","set","key1","11111")

    skynet.exit()
end)
