menu/button actions
shareMenu: aMenuTitleMorph 
	| menu |
	menu := MenuMorph new.
	self addServerCommandsTo: menu.
	menu localize.
	menu invokeAt: aMenuTitleMorph bottomLeft + (0 @ 10) in: self world