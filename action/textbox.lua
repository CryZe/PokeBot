local Textbox = {}

local Input = require "util.input"
local Memory = require "util.memory"
local Menu = require "util.menu"

local Data = require "data.data"

local alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ *():;[]ab-?!mf/.,"
-- local alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ *():;[]ポモ-?!♂♀/.,"

local nidoName = "A"
local nidoIdx = 1

local function getLetterAt(index)
	return alphabet:sub(index, index)
end

local function getIndexForLetter(letter)
	return alphabet:find(letter, 1, true)
end

function Textbox.name(letter, randomize)
	local inputting = Memory.value("menu", "text_input") == 240
	if inputting then
		if Memory.value("menu", "text_length") > 0 then
			Input.press("Start")
			return true
		end
		local lidx
		if letter then
			lidx = getIndexForLetter(letter)
		else
			lidx = nidoIdx
		end

		local crow = Memory.value("menu", "input_row")
		local drow = math.ceil(lidx / 9)
		if Menu.balance(crow, drow, true, 6, true) then
			local ccol = math.floor(Memory.value("menu", "column") / 2)
			local dcol = math.fmod(lidx - 1, 9)
			if Menu.sidle(ccol, dcol, 9, true) then
				Input.press("A")
			end
		end
	else
		-- TODO cancel when menu isn't up
		-- if Memory.value("menu", "current") == 7 then
		if Memory.raw(0x10B7) == 3 then
			Input.press("A", 2)
		elseif randomize then
			Input.press("A", math.random(1, 5))
		else
			Input.cancel()
		end
	end
end

function Textbox.getName()
	if nidoName == "a" then
		return "ポ"
	end
	if nidoName == "b" then
		return "モ"
	end
	if nidoName == "m" then
		return "♂"
	end
	if nidoName == "f" then
		return "♀"
	end
	return nidoName
end

function Textbox.getNamePlaintext()
	return nidoName
end

function Textbox.setName(name)
	if type(name) == "string" then
		nidoName = name
		nidoIdx = getIndexForLetter(name)
	elseif name >= 0 and name < #alphabet then
		nidoIdx = name + 1
		nidoName = getLetterAt(name)
	end
	Data.run.voted_name = nidoName
end

function Textbox.isActive()
	return Memory.value("game", "textbox") == 1
end

function Textbox.handle()
	if not Textbox.isActive() then
		return true
	end
	Input.cancel()
end

return Textbox
