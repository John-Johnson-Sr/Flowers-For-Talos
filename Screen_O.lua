--
-- Super Class
--

Screen_Object = { 	graphics 		= {},
					xLoc 			= 0, 
					yLoc 			= 0,
					graphic_index 	= 1		-- Integer: iterable graphic; String: hidden graphic
				}
Screen_Object.__index = Screen_Object

function Screen_Object:create( ObjtData )
	local objt = ObjtData or {}
	setmetatable( objt, self )
	
	objt.graphics_size = objt:graphicsCounter()
	objt.xScreen, objt.yScreen = love.graphics.getDimensions()
	
	return objt
end

function Screen_Object:drawObjt()
	love.graphics.print( self.graphics[self.graphic_index].glyph, self.xLoc, self.yLoc )
end

-- Returns the number of graphics
-- If "countHidden" exists, non-game graphics will be counted (i.e. mouse menu graphic)
function Screen_Object:graphicsCounter( countHidden )
	local count = 0

	if countHidden then
		for _ in pairs( self.graphics ) do count = count + 1 end
	else
		for _ in ipairs( self.graphics ) do count = count + 1 end
	end
		
	return count
end

-- Width and Height of current graphic
function Screen_Object:getWidthHeight()
	return 	self.graphics[self.graphic_index].width, 
			self.graphics[self.graphic_index].height
end

-- Get max coordinates for object's current graphic, accounting for it's width and height
function Screen_Object:getMaxCoordinates()
	return 	self.xLoc + self.graphics[self.graphic_index].width, 
			self.yLoc + self.graphics[self.graphic_index].height
end

function Screen_Object:inBounds( xMove, yMove, gWalls )
	local gWalls = gWalls or {}
	local object_width, object_height = self:getWidthHeight()
	local xWallFlag, yWallFlag = false
	
	for _, wall in pairs( gWalls ) do
		wallFlags = wall:isBlocking( xMove, yMove, object_width, object_height )
		if not( xWallFlag ) then	-- If flag raised, do not risk lowering it
			xWallFlag = wallFlags.xFlag 
		end
		if not( yWallFlag ) then	-- If flag raised, do not risk lowering it
			yWallFlag = wallFlags.yFlag
		end
		if xWallFlag and yWallFlag then
			break
		end
	end
	
	return	(	xMove >= 0 	and xMove + object_width <= self.xScreen	and not( xWallFlag )	),
			(	yMove >= 0 	and yMove + object_height <= self.yScreen	and not( yWallFlag )	)
end

-- Only should be used when changing graphic types
-- All frames within an animation set have the same hitbox
function Screen_Object:shiftObj()
	local xFlag, yFlag = self:inBounds( self.xLoc, self.yLoc )
	local _width, _height = self:getWidthHeight()
	
	if not( xFlag ) then
		self.xLoc = self.xScreen - _width
	elseif not( yFlag ) then
		self.yLoc = self.yScreen - _height
	else
		-- Nothing needs to happen
	end
end

-- Sets object's graphic to the next table; 
-- When at end the end, return to the beginning of the table
function Screen_Object:nextGraphic()
	if type( self.graphic_index ) == "string" then
		self.graphic_index = 1
	else
		local nextGraphic = self.graphic_index + 1
		if self.graphics[nextGraphic] then
			self.graphic_index = nextGraphic
		else
			self.graphic_index = 1
		end
	end
	
	self:shiftObj()		-- Account for the new graphic's width and height

	if self.frame_index then self.frame_index = 1 end	-- Animat_O
end

-- Sets object's graphic to the previous table;
-- When at the beginning, return to the end of the table
function Screen_Object:previousGraphic()
	if type( self.graphic_index ) == "string" then
		self.graphic_index = self.graphics_size
	else
		local nextGraphic = self.graphic_index - 1
		if self.graphics[nextGraphic] then
			self.graphic_index = nextGraphic
		else
			self.graphic_index = self.graphics_size
		end
	end
	
	self:shiftObj()		-- Account for the new graphic's width and height
	
	if self.frame_index then self.frame_index = 1 end 	-- Animat_O
end

-- Sets object's graphic to what is specified;
function Screen_Object:setGraphic( g_index )
	if self.graphics[g_index] then self.graphic_index = g_index
	else error"invalid graphic index being set"
	end
	
	self:shiftObj()		-- Account for the new graphic's width and height
	
	if self.frame_index then self.frame_index = 1 end	-- Animat_O
end

--
-- Unfinished/Unneccessary Functions
--

function Screen_Object:duplicateObj()
	local copy_objt = {}
	setmetatable( copy_objt, Screen_Object )
	
	for o_key, o_value in pairs(self) do
		
		if type(o_value) == "table" then
			-- Make a copy of the table within the main table.
			-- Recursion? not with this function b/c of metatable.
		
		else copy_objt[o_key] = o_value
		end
	end
	
	return copy_objt
end

-- Checks if object should exist on the screen, given the screen's current perspective of the game board.
function Screen_Object:onScreen( screen_xLoc, screen_yLoc, screen_width, screen_height )
	local screen_xMax = screen_xLoc + screen_width
	local screen_yMax = screen_yLoc + screen_height
	
	return (screen_xMax >= self.xLoc >= screen_xLoc) and (screen_yMax >= self.yLoc >= screen_yLoc)
end