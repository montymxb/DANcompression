--
--Copyright (c) 2014 Benjamin Wilson Friedman
--
--Permission is hereby granted, free of charge, to any person obtaining a copy
--of this software and associated documentation files (the "Software"), to deal
--in the Software without restriction, including without limitation the rights
--to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
--copies of the Software, and to permit persons to whom the Software is
--furnished to do so, subject to the following conditions:
--
--The above copyright notice and this permission notice shall be included in
--all copies or substantial portions of the Software.
--
--THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
--IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
--FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
--AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
--LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
--OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
--THE SOFTWARE.

local function startDan()
	print("\n\nWelcome to the Lua port of DAN compression V1.0.0\nProperty of -MXB-\nIf you would like to start please type either 'encrypt' or 'decrypt'\n Type 'exit' or 'close' to leave")
	local d=io.read()
	if d=="encrypt" then
		print("STARTING ENCRYPTION")
		encrypt()
	elseif d=="decrypt" then
		print("STARTING DECRYPTION")
		decrypt()
	elseif d=="close" or d=="exit" then
		print("simply put, goodbye")
	elseif d=="iamrude" then
		print("well you don't have to be rude...")
	elseif d=="do something" then
		print("vague demands return vague answers, let's try again")
		startDan()
	elseif d=="help" then
		print("--Help is here!\n If you're getting errors when putting in your filename double check to make sure that both the  DANcompression.lua file and your file\n are in the same directory.\n-Also make sure the terminal is in the proper directory for running the files\n-In order to be able to properly generate DAN files or compressed version of your files\n they must be in a text format! .java or .php or .whatever doesn't matter, as long as it is legible text\n-SAVE your original files before they're compressed, this software is experimental and could possibly cause all sorts of fuckery\n in your code\n-Modifying .DAN files can cause some serious damage on recreation, if you're the kid who likes to burn ants with a magnifying glass then by all means see for yourself\n-Recreated files from .DAN format are, for most cases, relatively illegible and should only be used in the final product from\n your SAVED legible versions\n-DAN compressions are intended for individual files under 8k at the moment")
		startDan()
	else
		print("i don't know what to do with that")
		startDan()
	end
end

function encrypt()
	
	-- initialize our last marker
	lastMarker = 10

	local encrypted={}
	local fileContents=openFile()
	local keyContents=getKeys()
	print("_____ENCRYPTING_____")
	for x=1,#fileContents do
		announceProgress(x,#fileContents)
		local character=fileContents:sub(x,x)
		for y=1,#keyContents do
			if keyContents:sub(y,y)==character and keyContents:sub(y+1,y+1)=="=" and keyContents:sub(y+2,y+2)~="=" then
				encrypted[#encrypted+1]=keyContents:sub(y+2,y+6)
				break
			end
		end
	end
	local encryptString=table.concat(encrypted)
	print("100%, Writing encrypted file...")
	local ef=io.open(fn .. ".dan","w")
	ef:write(encryptString)
	ef:close()
	print("Encryption done!")
	startDan()
	
end

function decrypt()

	-- initialize our last marker
	lastMarker = 10
	
	local result={}
	local fileContents=openFile()
	local keyContents=getKeys()
	local fileSize = #fileContents
	print("____DECRYPTING____")
	for x=1,#fileContents,5 do
		announceProgress(x, fileSize)
		local sequence=fileContents:sub(x,x+4)
		for y=1,fileSize do
			if keyContents:sub(y+1,y+1)=="=" and keyContents:sub(y+2,y+2)~="=" then
				if tonumber(sequence)==tonumber(keyContents:sub(y+2,y+7)) then
					result[#result+1]=keyContents:sub(y,y)
					break
				end
			end
		end
	end
	print("100%, Writing decrypted file\n")
	local real=table.concat(result)
	fn=string.gsub(fn,"dan","comp")
	local df=io.open(fn,"w")
	df:write(real)
	df:close()
	print("Decryption/Compression done!")
	startDan()
	
end

--gets the keys from the key file, returns an error if the key file is not present
function getKeys()
	local kf=assert(io.open("keylist.txt","r"))
	local keys=kf:read("*a")
	kf:close()
	
	return keys
end

--opens a file from user input
function openFile()
	print("\nPlease Enter the filename! Extension included")
	fn=io.read()
	local f=assert(io.open(fn,"r"))
	local t=f:read("*a")
	f:close()
	
	return t
end

-- announces current progress
function announceProgress(curLoc, size)

	-- get % completion
	local completionPercent = curLoc / size * 100
	
	if completionPercent > lastMarker then
		-- increment by 10% and print completion rate
		print(lastMarker .. "%")
		lastMarker=lastMarker+10
		
	end
end

startDan()
