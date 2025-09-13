--
--
--

Wall_Object = 	Screen_Object:create(	{	xStop, 	yStop	= 0,
											xDoor1,	yDoor1	= nil,
											xDoor2, yDoor2	= nil,
											thickness		= 1		-- In pixels
										}
									)
Wall_Object.__index = Wall_Object

--
-- Overloaded Functions
--

function Wall_Object:drawObjt()
	local offSet = 0
	local lineStatus = self:isHorizontal()
	
	for i=1, self.thickness do
		if lineStatus then
			love.graphics.line( self.xLoc, 					--!!!!! Maybe use rectangle instead of line
								self.yLoc + offSet, 
								self.xStop, 
								self.yStop + offSet )
		else
			love.graphics.line(	self.xLoc + offSet,
								self.yLoc,
								self.xStop + offSet,
								self.yStop )
		end
		offSet = offSet + 1
	end
end

--
-- New Functions
--

function Wall_Object:isTouching( x, y, width, height )
	-- return whether the line/wall is overlapping the provided hitbox 
	return false
end

function Wall_Object:isBlocking( x, y, width, height )
	local flags	=	{	xFlag = false,
						yFlag = false
					}
	
	local touchFlag = self:isTouching( x, y, width, height )
	
	if self:isVertical() and touchFlag then
		flags.yFlag = true
	elseif self:isHorizontal() and touchFlag then
		flags.xFlag = true
	else
		-- Nothing... for now
	end
	
	return flags
end

function Wall_Object:isHorizontal()
	return self.yLoc == self.yStop
end

function Wall_Object:isVertical()
	return self.xLoc == self.xStop
end

function Wall_Object:openDoor()
end

function Wall_Object:closeDoor()
end
