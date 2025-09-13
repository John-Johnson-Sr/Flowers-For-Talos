--
-- Mouse Object
--


-- Mouse_Object inherits Screen_Object
Mouse_Object = 	Screen_Object:create(	{	pause_flag = true
										}
									)
Mouse_Object.__index = Mouse_Object

--
-- Overloaded Functions
--

function Mouse_Object:drawObjt()
	if self.pause_flag then 
		love.graphics.print( self.graphics["menu"].glyph, 				self.xLoc, self.yLoc )
	else
		love.graphics.print( self.graphics[self.graphic_index].glyph, 	self.xLoc, self.yLoc )
	end
end

function Mouse_Object:nextGraphic()
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
end

function Mouse_Object:previousGraphic()
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
end

function Mouse_Object:setGraphic( g_index )
	if self.graphics[g_index] then self.graphic_index = g_index
	else error"invalid graphic index being set"
	end
end

--
-- New Functions
--
