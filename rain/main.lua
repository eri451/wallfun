require "helper"
require "wall"

function love.keypressed(key)
	if key == "escape" then
		love.event.push "q"
	
	end
	
end


function love.load()
	wall = Wall("ledwall", 1338, 3)

	time = love.timer.getTime() * 1000
    
    tick = 0

end

drops = {}
colours = {"ff0000", "0000ff", "00ff00", "ff00ff", "ffff00", "00ffff"}
fade1   = {"bb0000", "0000bb", "00bb00", "bb00bb", "bbbb00", "00bbbb"}
fade2   = {"770000", "000077", "007700", "770077", "777700", "007777"}
fade3   = {"330000", "000033", "003300", "330033", "333300", "003333"}

function love.update(dt)
	-- constant 30 FPS
	local t = love.timer.getTime() * 1000
	time = time + 1000 / 30
	love.timer.sleep(time - t)
        
	if math.random(2) == 1 then
	    local drop = { 
	        x = math.random(0, 15),
	        y = 0,
	        colour
	    }
	    drop.colour = math.random(1, 6)
		table.insert(drops, drop)
	end

	for i, drop in ipairs(drops) do
		drop.y = drop.y + 1
		if drop.y > 18 then
			table.remove(drops, i)
		end
	end


end

function drop()
	
	for i, drop in ipairs(drops) do
	    local y = math.floor(drop.y)
		wall:pixel(drop.x, y, colours[drop.colour])
		wall:pixel(drop.x, y - 1, fade1[drop.colour])
		wall:pixel(drop.x, y - 2, fade2[drop.colour])
		wall:pixel(drop.x, y - 3, fade3[drop.colour])
		wall:pixel(drop.x, y - 4, "000000")
	end
    
end

function love.draw()

    drop()
	-- send the stuff abroad
	wall:draw()
end



