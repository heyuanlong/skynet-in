local skynet = require "skynet"
local config = require "config.testConfig"
local logger = require "common.log.commonlog"
local queue = require "skynet.queue"

local cs 	= queue()  -- cs 是一个执行队列
local cs2 	= queue()  -- cs 是一个执行队列

local function func1()
  logger.common.error("func1")
end
local function func2(arg1,arg2)
	arg1 = arg1 or "nil"
	arg2 = arg2 or "nil"
	logger.common.error("func2"..arg1..arg2)
end

skynet.start(function()

	cs(func1)
	cs(func2,1,2)
	
	cs2(func1)
	cs2(func2,1,2)
	
    skynet.exit()

end)
