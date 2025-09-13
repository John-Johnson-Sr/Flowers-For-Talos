--
--	Data for Initializing Game Objects
--

-- !!!!! make width and height a property of PLAYER_DATA
-- i.e. width and height (hitbox) will be the same for a each direction, animation, or frame; within every graphic type of an object
PLAYER_DATA		=	{ 	xLoc 			= 	0,
						yLoc 			= 	0,
						velocity		=	1,
						graphic_index 	= 	1,
						animate_index	=	"idle",
						frame_index		=	1,
						graphics 		= 	{	[1] = 	{	width	= 10,
															height	= 10,
															wd		=	{	[1]	=	{	glyph	= "^>",
																						delay	= (1/2)
																					},
																			[2] =	{	glyph	= "^>^>",
																						delay	= (1/2)
																					},
																			[3] =	{	glyph	= "^>^>^>",
																						delay	= (1/2)
																					}
																		},
															wa		=	{	[1]	=	{	glyph	= "^<",
																						delay	= (1/2)
																					},
																			[2] =	{	glyph	= "^<^<",
																						delay	= (1/2)
																					},
																			[3] =	{	glyph	= "^<^<^<",
																						delay	= (1/2)
																					}
																		},
															sd		=	{	[1]	=	{	glyph	= "v>",
																						delay	= (1/2)
																					},
																			[2] =	{	glyph	= "v>v>",
																						delay	= (1/2)
																					},
																			[3] =	{	glyph	= "v>v>v>",
																						delay	= (1/2)
																					}
																		},
															sa		=	{	[1]	=	{	glyph	= "v<",
																						delay	= (1/2)
																					},
																			[2] =	{	glyph	= "v<v<",
																						delay	= (1/2)
																					},
																			[3] =	{	glyph	= "v<v<v<",
																						delay	= (1/2)
																					}
																		},
															w	 	= 	{	[1]	=	{	glyph	= "^^",
																						delay	= (1/2)
																					},
																			[2] =	{	glyph	= "^^^^",
																						delay	= (1/2)
																					},
																			[3] =	{	glyph	= "^^^^^^",
																						delay	= (1/2)
																					}
																		},
															s	 	= 	{	[1]	=	{	glyph	= "vv",
																						delay	= (1/2)
																					},
																			[2] =	{	glyph	= "vvvv",
																						delay	= (1/2)
																					},
																			[3] =	{	glyph	= "vvvvvv",
																						delay	= (1/2)
																					}
																		},
															a	 	= 	{	[1]	=	{	glyph	= "<<",
																						delay	= (1/2)
																					},
																			[2] =	{	glyph	= "<<<<",
																						delay	= (1/2)
																					},
																			[3] =	{	glyph	= "<<<<<<",
																						delay	= (1/2)
																					}
																		},
															d 		= 	{	[1]	=	{	glyph	= ">>",
																						delay	= (1/2)
																					},
																			[2] =	{	glyph	= ">>>>",
																						delay	= (1/2)
																					},
																			[3] =	{	glyph	= ">>>>>>",
																						delay	= (1/2)
																					}
																		},
															idle	=   {	[1]	=	{	glyph	= " |",
																						delay	= (1/16)
																					},
																			[2] =	{	glyph	= " /",
																						delay	= (1/16)
																					},
																			[3] =	{	glyph	= "--",
																						delay	= (1/16)
																					},
																			[4] =	{	glyph	= " \\",
																						delay	= (1/16)
																					}
																		}
														}, 
											
												[2] = 	{	width	= 10,
															height 	= 10,
															wd		=	{	[1]	=	{	glyph 	= "^> !dl",
																						delay	= (1/60)
																					}
																		},
															wa		=	{	[1]	=	{	glyph 	= "^< !dl",
																						delay	= (1/60)
																					}
																		},
															sd		=	{	[1]	=	{	glyph 	= "v> !dl",
																						delay	= (1/60)
																					}
																		},
															sa		=	{	[1]	=	{	glyph 	= "v< !dl",
																						delay	= (1/60)
																					}
																		},
															w 		= 	{	[1]	=	{	glyph 	= "^ !dl",
																						delay	= (1/60)
																					}
																		},
															s 		= 	{	[1]	=	{	glyph 	= "v !dl",
																						delay	= (1/60)
																					}
																		},
															a 		= 	{	[1]	=	{	glyph 	= "< !dl",
																						delay	= (1/60)
																					}
																		},
															d 		= 	{	[1]	=	{	glyph 	= "> !dl",
																						delay	= (1/60)
																					}
																		},
															idle	=   {	[1]	=	{	glyph 	= "!dl",
																						delay	= (1/60)
																					}
																		}
														},
											
												[3] =	{	width	= 70,
															height  = 10,
															wd		=	{	[1]	=	{	glyph 	= "^> Hello World!",
																						delay	= (1/60)
																					}
																		},
															wa		=	{	[1]	=	{	glyph 	= "^< Hello World!",
																						delay	= (1/60)
																					}
																		},
															sd		=	{	[1]	=	{	glyph 	= "v> Hello World!",
																						delay	= (1/60)
																					}
																		},
															sa		=	{	[1]	=	{	glyph 	= "v< Hello World!",
																						delay	= (1/60)
																					}
																		},
															w 		= 	{	[1]	=	{	glyph 	= "^ Hello World!",
																						delay	= (1/60)
																					}
																		},
															s 		= 	{	[1]	=	{	glyph 	= "v Hello World!",
																						delay	= (1/60)
																					}
																		},
															a 		= 	{	[1]	=	{	glyph 	= "< Hello World!",
																						delay	= (1/60)
																					}
																		},
															d 		= 	{	[1]	=	{	glyph 	= "> Hello World!",
																						delay	= (1/60)
																					}
																		},
															idle	=   {	[1]	=	{	glyph 	= "Hello World!",
																						delay	= (1/60)
																					}
																		}
														}
											}
					}


MOUSE_DATA		=	{	xLoc			=	0,
						yLoc			=	0,
						graphic_index	=	1,
						pause_flag		=	true,
						graphics		=	{	["menu"] = 	{	glyph 	= "mm",
																width 	= 0,
																height 	= 0
															},
												
												[1]		=	{	glyph	= "MOUSE!",
																width	= 60,
																height	= 10
															},
												[2]		=	{	glyph	= "!ESUOM",
																width	= 0,
																height	= 0
															},
												[3]		=	{	glyph	= "oof",
																width	= 0,
																height	= 0
															}
											}
					}
