right button menu
rightButtonMenu
	"Present the right button menu."

	| menu |
	menu := CustomMenu new.
	menu add: 'grab screen region for new costume' action: #grabFromScreen.
	menu add: 'export this sprite' action: #exportObject.
	menu addLine.
	menu add: 'duplicate' action: #duplicate.
	menu add: 'delete' action: #undoableDeleteSprite.
	menu addLine.
	menu add: 'resize this sprite' action: #resizeHandle.
	menu add: 'rotate this sprite' action: #rotateHandle.
	menu localize; invokeOn: self.
