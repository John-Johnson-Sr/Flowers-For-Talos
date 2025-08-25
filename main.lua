-- 60tps : 0.01667
-- 30tps : 0.03333
local LogRate 		= 0.01667
local MoveDistance 	= 2

local update_timer 	= 0
local xLoc, yLoc = 0, 0
local xMax, yMax = love.graphics.getDimensions()
	  xMax, yMax = xMax - 58, yMax - 10		-- Account for graphic's size



function love.load(args)
end



function love.draw()
	love.graphics.print('Hello World!', xLoc, yLoc)
end



function love.update(dt)
	update_timer = update_timer + dt
  
	if update_timer >= LogRate then
		update_timer = 0
		
		if love.keyboard.isDown("w") then yLoc = yLoc - MoveDistance end
		if love.keyboard.isDown("s") then yLoc = yLoc + MoveDistance end
		if love.keyboard.isDown("a") then xLoc = xLoc - MoveDistance end
		if love.keyboard.isDown("d") then xLoc = xLoc + MoveDistance end

		-- Check for out of bounds
		if xLoc < 0 	then xLoc = 0 		end
		if xLoc > xMax 	then xLoc = xMax 	end
		if yLoc < 0 	then yLoc = 0 		end
		if yLoc > yMax 	then yLoc = yMax 	end
	end
end



function love.keypressed(key)
	if key == "escape" then love.event.quit() end
end