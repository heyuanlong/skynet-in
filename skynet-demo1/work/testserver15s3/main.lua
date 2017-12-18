local skynet = require "skynet"
require "skynet.manager"
local cluster = require "cluster"
local config = require "config.testServerConfig"
local logger = require "common.log.skynetlog"
local harbor = require "skynet.harbor"


skynet.start(function()
	log = logger.create("testserver15s3",logger.level.debug)
    log.info("start testserver15s3")

 
    local test1 = skynet.newservice("test1")
    skynet.name(".test3", test1)


    local node = harbor.queryname("test2")
    if node == nil then
        log.info("xxxxxxxx")
    else
        local value = skynet.call(node,"lua","get","key1")
        log.info("value:"..value)
    end
    
    local value = skynet.call("test2","lua","get","key1")
    log.info("value:"..value)


    skynet.exit()
end)
