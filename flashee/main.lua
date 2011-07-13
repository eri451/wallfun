require "helper"
require "wall"

i = 1
mode = true
color = "000000"

function love.keypressed(key)
	if key == "escape" then
		love.event.push "q"	
	end
	if key == " " then
	    mode = not mode
	end
	if key == "+" then
	    i = (i)%7 + 1
	end
	if key == "-" then
	    i = (i + 5)%7  + 1
	end
end


function love.load()
	wall = Wall("ledwall", 1338, 3)

	time = love.timer.getTime() * 1000
    
    tick = 0

end

local color   = "000000"
local colors  = {"00ff00", "ff0000", "0000ff", "ffff00", "00ffff", "ff00ff", "ffffff"}
local isflash = true


function love.update(dt)
	-- constant ?? FPS
	local t = love.timer.getTime() * 1000
	time = time + 1000 / 15
	love.timer.sleep(time - t)

    flash   = colors[i]
    black   = colors[(i+1)%7 + 1]
    
    if mode == true then
        for y = 0,16 do    
            for x = 0, 16 do
                color = isflash and flash or black
                wall:pixel(x, y, color)
              isflash = not isflash
            end        
        end
    else
        for y = 0,16 do    
            for x = 0, 16 do
                color = isflash and flash or black
                wall:pixel(x, y, color)
            end 
        end       
        isflash = not isflash
    end
end


function love.draw()

	-- send the stuff abroad
	wall:draw()
end
