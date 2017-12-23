interaction
cancelled
	"Cancel button was pressed. Cancel painting without saving."

	oldCostumeName ifNotNil: [
		originalObject ifNotNil: [
			originalObject revertToCostume: oldCostumeName.
			deleteSpriteOnCancel ifTrue: [originalObject deleteSprite]]].

	self exitPaintEditor.
	super cancelled.
