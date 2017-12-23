right button menu
rightButtonMenu
	"Present the right button menu."

	| menu |
	menu := MenuMorph new.
	menu target: self target.
	menu add: 'show' selector: #makeVisible.
	menu add: 'export this sprite' selector: #exportObject.
	menu addLine.
	menu add: 'duplicate' selector: #duplicateNoAttach.
	menu add: 'delete' selector: #undoableDeleteSprite.
	menu localize.
	menu invokeAt: Sensor cursorPoint in: self world