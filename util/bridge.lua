local Bridge = {}

local Utils = require "util.utils"

local json = require "external.json"

local socket = require "socket"
local memory = require "util.memory"

local client = nil
local timeStopped = true
local timeMin = 0
local timeFrames = 0

local function send(prefix, body)
	if client then
		local message = prefix
		if body then
			message = message.." "..body
		end
		client:send(message.."\n")
		return true
	end
end

local function readln()
	if client then
		local s, status, partial = client:receive("*l")
		if status == "closed" then
			client = nil
			return nil
		end
		if s and s ~= "" then
			return s
		end
	end
end

-- Wrapper functions

function Bridge.init(gameName)
	if socket then
		-- io.popen("java -jar Main.jar")
		client = socket.connect("localhost", 16834)
		if client then
			client:settimeout(0.005)
			client:setoption("keepalive", true)
			print("Connected to Java!");
			send("init,"..gameName)
			return true
		else
			print("Error connecting to Java!");
		end
	end
end

function Bridge.tweet(message)
	if STREAMING_MODE then
		--print("tweet::"..message)
		--send("tweet", message)
		return true
	end
end

function Bridge.pollForName()
	Bridge.polling = true
	--send("poll_name")
end

function Bridge.chatRandom(...)
	return Bridge.chat(Utils.random(arg))
end

function Bridge.chat(message, suppressed, extra, newLine)
	if not suppressed then
		if extra then
			p(message.." | "..extra, newLine)
		else
			p(message, newLine)
		end
	end
	--return send("msg", message)
	return true
end

function Bridge.time()
	if (not timeStopped) then
		local frames = memory.raw(0x1A45)
		local seconds = memory.raw(0x1A44)
		local minutes = memory.raw(0x1A43)
		local hours = memory.raw(0x1A41)

		if (frames == timeFrames) then
			local seconds2 = seconds + (frames / 60)
			local message = hours..":"..minutes..":"..seconds2
			send("setgametime", message)
			if timeFrames == 59 then
				timeFrames = 0
			else
				timeFrames = (frames + 1)
			end
		end

		send("unpausegametime")
	end
end

function Bridge.stats(message)
	--return send("stats", message)
	return true
end

function Bridge.command(command)
	print("Bridge Command")
	return send(command)
end

function Bridge.comparisonTime()
	print("Bridge Comparison Time")
	return send("getcomparisonsplittime")
end

function Bridge.process()
	local response = readln()
	if response then
		-- print(">"..response)
		if response:find("name:") then
			return response:gsub("name:", "")
		end
	end
end

function Bridge.input(key)
	--send("input", key)
end

function Bridge.caught(name)
	if name then
		--send("caught", name)
	end
end

function Bridge.hp(curr_hp, max_hp, curr_xp, max_xp, level)
	--send("hpxp", curr_hp..","..max_hp..","..curr_xp..","..max_xp..","..level)
end


function Bridge.liveSplit()
	-- print("Bridge Start Timer")
	send("initgametime")
	send("pausegametime")
	send("starttimer")
	timeStopped = false
end

function Bridge.split(finished)
	if finished then
		timeStopped = true
	end
	send("split")
	Utils.splitUpdate()
end

function Bridge.pausegametime()
	send("pausegametime")
end

function Bridge.encounter()
	--send("encounter")
end

function Bridge.report(report)
	if INTERNAL and not STREAMING_MODE then
		print(json.encode(report))
	end
	send("report", json.encode(report))
end

-- GUESSING

function Bridge.guessing(guess, enabled)
	send(guess, tostring(enabled))
end

function Bridge.guessResults(guess, result)
	send(guess.."results", result)
end

function Bridge.moonResults(encounters, cutter)
	Bridge.guessResults("moon", encounters..","..(cutter and "cutter" or "none"))
end

-- RESET

function Bridge.reset()
	send("reset")
	timeStopped = false
end

function Bridge.close()
	if client then
		client:close()
		client = nil
	end
	print("Bridge closed")
end

return Bridge
