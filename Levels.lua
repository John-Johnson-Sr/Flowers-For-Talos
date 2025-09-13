--
-- Menu ["menu"] and Level [1-...] Data
--

GAME_LEVELS = {}

GAME_LEVELS["menu"] = 	{ 	back_graphic 	= 	"sssThis is the menu screen :)\nPress Space to quit",
							buttons 		= 	{},
							game_objts		= 	{} 		
						}
		
GAME_LEVELS[1] 		= 	{	game_objts		= 	{},
							walls			=	{	[1]	=	Wall_Object:create	(	{	xLoc 		= 0,
																						yLoc 		= 99,
																						xStop 		= 100,
																						yStop 		= 99,
																						thickness 	= 3
																					}
																				),
													[2] = 	Wall_Object:create	(	{	xLoc 		= 160,
																						yLoc 		= 0,
																						xStop 		= 160,
																						yStop 		= 80,
																						thickness 	= 1
																					}
																				),
												}
						}

GAME_LEVELS[2] 		= {}
GAME_LEVELS[3] 		= {}
GAME_LEVELS[4] 		= {}
GAME_LEVELS[5] 		= {}
GAME_LEVELS[6] 		= {}
				