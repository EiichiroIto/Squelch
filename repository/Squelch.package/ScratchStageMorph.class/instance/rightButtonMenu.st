menus
rightButtonMenu
	"Present the right button menu."

	| menu |
	menu := MenuMorph new.
	menu target: self.
	menu add: 'grab screen region for new sprite' selector: #grabSpriteFromScreen.
	menu addLine.
	menu add: 'save picture of stage...' selector: #stageShot.
	menu localize.
	menu invokeAt: ActiveHand position in: self world