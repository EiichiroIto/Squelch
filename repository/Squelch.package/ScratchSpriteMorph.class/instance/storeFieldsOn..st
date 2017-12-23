object i/o
storeFieldsOn: anObjStream

	| oldP |
	self sayNothing.  "delete talk bubble before saving"

	"for backward compatability, remove offsetWhenRotated and subtract costume rotationCenter when saving"
	oldP := self position.
	self position: self position + offsetWhenRotated - costume rotationCenter.

	super storeFieldsOn: anObjStream.
	self storeFieldsNamed: #(
		visibility
		scalePoint
		rotationDegrees
		rotationStyle
		volume
		tempoBPM
		draggable
		sceneStates
		lists
	) on: anObjStream.

	self position: oldP.  "restore position"
