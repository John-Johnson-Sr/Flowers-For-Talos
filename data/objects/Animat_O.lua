--
--
-- !!! move commands only compatible with player object (i.e. "wasd") 
-- Create a new class for the player object; which overloads the move functions of Animating_Object

-- Animating_Object inherits Screen_Object
Animating_Object = 	Screen_Object:create(	{	Velocity 		= 1,
												animate_index 	= "",	-- String
												frame_index		= 1		-- Integer
											}
										)
Animating_Object.__index = Animating_Object

--
-- Overloaded Functions
--

function Animating_Object:drawObjt()
	love.graphics.print( 	self.graphics[self.graphic_index][self.animate_index][self.frame_index].glyph, 
							self.xLoc, 
							self.yLoc 
						)
end

--
-- New Functions
--

function Animating_Object:nextAnimationFrame()
	local currentAnimationSet 	= self.graphics[self.graphic_index][self.animate_index]
	local nextFrame 			= self.frame_index + 1
	
	if currentAnimationSet[nextFrame] then
		self.frame_index = nextFrame
	else
		self.frame_index = 1
	end
end

-- Will need the size of every animation table in order to loop back to the end
-- when the beginning is reached.
function Animating_Object:previousAnimationFrame()
end

function Animating_Object:setAnimationFrame()
end

-- Changes direction of object, or increments to the next animation frame if direction didn't change.
-- !!!!! May need to consider the next frame's width and height; then adjust self.xLoc and self.yLoc
function Animating_Object:orientateObj( direction, dLF ) 
	local currentFrame = self.graphics[self.graphic_index][self.animate_index][self.frame_index]

	if self.animate_index == direction then		-- object is moving in the same direction
		if currentFrame.delay <= dLF then		-- wait until delay time is passed
			self:nextAnimationFrame()			-- set next frame of animation
			return true
		
		else
			return false
		end
	else										-- Change of direction does not wait for delay time to pass
		self.animate_index	= direction			-- set object's new animation
		self.frame_index	= 1					-- set animation to it's first frame
		return true								-- Flag that animation changed
	end
end

-- wd
function Animating_Object:moveUpRight( dLastFrame, gWalls )
	local temp_xLoc, 	temp_yLoc 	= self.xLoc + self.velocity, self.yLoc - self.velocity
	local temp_xFlag, 	temp_yFlag 	= self:inBounds( temp_xLoc, temp_yLoc, gWalls )
	
	if temp_xFlag and temp_yFlag then		
		self.xLoc, self.yLoc = temp_xLoc, temp_yLoc
		return self:orientateObj( "wd", dLastFrame )
		
	elseif temp_xFlag then
		self.xLoc = temp_xLoc
		return self:orientateObj( "d", dLastFrame )
		
	elseif temp_yFlag then
		self.yLoc = temp_yLoc
		return self:orientateObj( "w", dLastFrame )
		
	else 
		return self:moveIdle( dLastFrame )	-- Not in bounds; idle in corner
	end
end

-- wa
function Animating_Object:moveUpLeft( dLastFrame, gWalls )
	local temp_xLoc,	temp_yLoc	= self.xLoc - self.velocity, self.yLoc - self.velocity
	local temp_xFlag, 	temp_yFlag	= self:inBounds( temp_xLoc, temp_yLoc, gWalls )
	
	if temp_xFlag and temp_yFlag then
		self.xLoc, self.yLoc = temp_xLoc, temp_yLoc
		return self:orientateObj( "wa", dLastFrame )
		
	elseif temp_xFlag then
		self.xLoc = temp_xLoc
		return self:orientateObj( "a", dLastFrame )
		
	elseif temp_yFlag then
		self.yLoc = temp_yLoc
		return self:orientateObj( "w", dLastFrame )
	
	else 
		return self:moveIdle( dLastFrame )	-- Not in bounds; idle in corner
	end
end

-- sd
function Animating_Object:moveDownRight( dLastFrame, gWalls )
	local temp_xLoc, 	temp_yLoc	= self.xLoc + self.velocity, self.yLoc + self.velocity
	local temp_xFlag,	temp_yFlag	= self:inBounds( temp_xLoc, temp_yLoc, gWalls )
	
	if temp_xFlag and temp_yFlag then
		self.xLoc, self.yLoc = temp_xLoc, temp_yLoc
		return self:orientateObj( "sd", dLastFrame )
		
	elseif temp_xFlag then
		self.xLoc = temp_xLoc
		return self:orientateObj( "d", dLastFrame )
	
	elseif temp_yFlag then
		self.yLoc = temp_yLoc
		return self:orientateObj( "s", dLastFrame )
		
	else 
		return self:moveIdle( dLastFrame )	-- Not in bounds; idle in corner
	end
end

-- sa
function Animating_Object:moveDownLeft( dLastFrame, gWalls )
	local temp_xLoc, 	temp_yLoc	= self.xLoc - self.velocity, self.yLoc + self.velocity
	local temp_xFlag,	temp_yFlag	= self:inBounds( temp_xLoc, temp_yLoc, gWalls )
	
	if temp_xFlag and temp_yFlag then
		self.xLoc, self.yLoc = temp_xLoc, temp_yLoc
		return self:orientateObj( "sa", dLastFrame )
	
	elseif temp_xFlag then
		self.xLoc = temp_xLoc
		return self:orientateObj( "a", dLastFrame )
	
	elseif temp_yFlag then
		self.yLoc = temp_yLoc
		return self:orientateObj( "s", dLastFrame )
		
	else 
		return self:moveIdle( dLastFrame )	-- Not in bounds; idle in corner
	end
end

-- w
function Animating_Object:moveUp( dLastFrame, gWalls )
	local temp_yLoc 	= self.yLoc - self.velocity
	local _, temp_yFlag	= self:inBounds( 0, temp_yLoc, gWalls ) 	-- Only care about y-axis boundary
	
	if temp_yFlag then
		self.yLoc = temp_yLoc
		return self:orientateObj( "w", dLastFrame )
	
	else 
		return self:moveIdle( dLastFrame )	-- Not in bounds; idle on edge
	end
end

-- s
function Animating_Object:moveDown( dLastFrame, gWalls )
	local temp_yLoc		= self.yLoc + self.velocity
	local _, temp_yFlag = self:inBounds( 0, temp_yLoc, gWalls )		-- Only care about y-axis boundary
	
	if temp_yFlag then
		self.yLoc = temp_yLoc
		return self:orientateObj( "s", dLastFrame )
		
	else 
		return self:moveIdle( dLastFrame )	-- Not in bounds; idle on edge
	end
end

-- a
function Animating_Object:moveLeft( dLastFrame, gWalls )
	local temp_xLoc		= self.xLoc - self.velocity
	local temp_xFlag, _ = self:inBounds( temp_xLoc, 0, gWalls )		-- Only care about x-axis boundary
	
	if temp_xFlag then
		self.xLoc = temp_xLoc
		return self:orientateObj( "a", dLastFrame )
	
	else 
		return self:moveIdle( dLastFrame )	-- Not in bounds; idle on edge
	end
end

-- d
function Animating_Object:moveRight( dLastFrame, gWalls )
	local temp_xLoc		= self.xLoc + self.velocity
	local temp_xFlag, _ = self:inBounds( temp_xLoc, 0, gWalls )		-- Only care about x-axis boundary
	
	if temp_xFlag then
		self.xLoc = temp_xLoc
		return self:orientateObj( "d", dLastFrame )
	
	else 
		return self:moveIdle( dLastFrame )	-- Not in bounds; idle on edge
	end
end

-- idle
function Animating_Object:moveIdle( dLastFrame )
	return self:orientateObj( "idle", dLastFrame )
end
