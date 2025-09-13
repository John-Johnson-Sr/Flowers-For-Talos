--
-- Flowers For Talos
-- 2025 DOSember Game Jam
-- cuckiemunster
--

-- Object Logic
require( "data.objects.Screen_O" 	)
require( "data.objects.Animat_O"	)
require( "data.objects.Mouse_O"		)
require( "data.objects.Enemy_O"		)
require( "data.objects.Ball_O"		)
require( "data.objects.Stomp_O"		)
require( "data.objects.BHole_O"		)
require( "data.objects.Bullet_O"	)
require( "data.objects.Wall_O"		)
require( "data.objects.Dummie_O"	)
require( "data.objects.Smarty_O"	)

-- Object and Level Data
require( "data.GameData"			)
require( "data.Levels"				)

-- Functions
require( "data.core.Builders" 		)



function love.load(args)
	-- Log file 
	-- !! Test adding "C:\\" inorder to save in the same place regardless of the working dir
	writeDirectory = args[1] .. "\\saves" 	-- Dependent on DosBox's current working directory.
	love.filesystem.setWriteDir( writeDirectory )
	love.filesystem.mount( writeDirectory )

	-- Game logic
	LogRate 					= (1/60)	-- 60 tics per second
	player_timer 				= 0
	animation_timer				= 0
	animation_change			= false
	text_input_enable			= false
	text_input_data				= ":: "
	menu_enable					= true
	curr_level					= 1
	
	-- Game objects
	player_obj 					= Animating_Object:create( PLAYER_DATA )
	mouse_obj					= Mouse_Object:create( MOUSE_DATA )
end



function love.draw()
	mouse_obj:drawObjt()		-- Mouse is always visible

	if menu_enable then
		love.graphics.print( GAME_LEVELS.menu.back_graphic	, 0		, 0 )
	
	elseif text_input_enable then
		love.graphics.print( text_input_data				, 10	, 90 )
		
	else
		player_obj:drawObjt()

		-- Draw all objects from current level.
		for _, gameObj in pairs( GAME_LEVELS[curr_level].game_objts ) do
			gameObj:drawObjt()
		end
		
		-- Draw all walls from the current level.
		for _, gameObj in pairs( GAME_LEVELS[curr_level].walls ) do
			gameObj:drawObjt()
		end
	end
end



function love.update(dt)
	player_timer 	= player_timer + dt
	animation_timer	= animation_timer + dt
	levelWalls = GAME_LEVELS[curr_level].walls
  
	if (player_timer >= LogRate) and not(text_input_enable) and not(menu_enable) then
		player_timer = 0

		-- Update player
		if		love.keyboard.isDown("w") and love.keyboard.isDown("d") then 
			animation_change = player_obj:moveUpRight( animation_timer, levelWalls )
		elseif	love.keyboard.isDown("w") and love.keyboard.isDown("a") then 
			animation_change = player_obj:moveUpLeft( animation_timer, levelWalls )
		elseif	love.keyboard.isDown("s") and love.keyboard.isDown("d") then 
			animation_change = player_obj:moveDownRight( animation_timer, levelWalls )
		elseif	love.keyboard.isDown("s") and love.keyboard.isDown("a") then 
			animation_change = player_obj:moveDownLeft( animation_timer, levelWalls )
		elseif 	love.keyboard.isDown("w") then 
			animation_change = player_obj:moveUp( animation_timer, levelWalls )
		elseif 	love.keyboard.isDown("s") then 
			animation_change = player_obj:moveDown( animation_timer, levelWalls )
		elseif 	love.keyboard.isDown("a") then 
			animation_change = player_obj:moveLeft( animation_timer, levelWalls )
		elseif 	love.keyboard.isDown("d") then 
			animation_change = player_obj:moveRight( animation_timer, levelWalls )
		else 
			animation_change = player_obj:moveIdle( animation_timer, levelWalls ) 
		end
		
		if animation_change then
			animation_timer 	= 0
			animation_change 	= false
		end
		
		-- Move all autonomous objects within a level
		
		-- Collision Detection
	end
end


-- Instead of concatenating every key when pressed, store them in an array and when done use 
-- the table's built-in function to concatenate all entries. 
function love.keypressed(key)
	if menu_enable then
		if 		key == "escape"		then 	menu_enable = false
											if not( text_input_enable ) then 
												-- set the graphic rather tan raising a flag
												mouse_obj.pause_flag = false
											end
											
		elseif 	key == "space" 		then 	love.event.quit()
		end
	
	elseif text_input_enable then
		if 		key == "return"		then 	text_input_enable 		= false
											-- set the graphic rather tan raising a flag
											mouse_obj.pause_flag 	= false
											
		elseif	key == "escape"		then	menu_enable = true
		else	text_input_data = text_input_data .. key	-- Change this!
		end
		
	else
		if 		key == "escape" 	then 	menu_enable 			= true
											-- set the graphic rather tan raising a flag
											mouse_obj.pause_flag 	= true
											
		elseif 	key == "q"			then 	text_input_enable 		= true
											text_input_data			= ":: "
											-- set the graphic rather tan raising a flag
											mouse_obj.pause_flag 	= true
		
		elseif	key == "space"		then	player_obj:nextGraphic()
		end
	end
end


 
function love.mousemoved(x, y, dx, dy)
	mouse_obj.xLoc, mouse_obj.yLoc = x, y 
end



function love.mousepressed(x, y, button)
	if not( menu_enable ) and not ( text_input_enable ) then 
		if 		button == 0 then mouse_obj:nextGraphic()
		elseif 	button == 1 then mouse_obj:previousGraphic()
		else end
	end
end



function love.mousereleased(x, y, button)
end
