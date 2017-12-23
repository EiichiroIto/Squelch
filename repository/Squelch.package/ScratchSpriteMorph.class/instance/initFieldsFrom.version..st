object i/o
initFieldsFrom: anObjStream version: classVersion

	super initFieldsFrom: anObjStream version: classVersion.
	self initFieldsNamed: #(
		visibility
		scalePoint
		rotationDegrees
		rotationStyle
	) from: anObjStream.

	scalePoint ifNil: [scalePoint := 1.0@1.0].
	offsetWhenRotated := 0@0.
	draggable := false.  "default for old sprites"
	self layoutChanged.

	classVersion = 1 ifTrue: [^ self].

	"fields added in version 2"
	self initFieldsNamed: #(
		volume
		tempoBPM
		draggable
	) from: anObjStream.
	classVersion = 2 ifTrue: [^ self].

	"fields added in version 3"
	self initFieldsNamed: #(
		sceneStates
		lists
	) from: anObjStream.
	lists ifNil: [lists := Dictionary new].  "work around"
