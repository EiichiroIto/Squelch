object i/o
initFieldsFrom: anObjStream version: classVersion

	super initFieldsFrom: anObjStream version: classVersion.
	self initFieldsNamed: #(
		titleMorph
		readout
		readoutFrame
		scratchSlider
		watcher) from: anObjStream.
	watcher ifNotNil: [watcher useRoundedCorners].
	classVersion = 1 ifTrue: [^ self].
	
	"fields added in version 2"
	self initFieldsNamed: #(
		isSpriteSpecific
		unused
	) from: anObjStream.

	"fields added in version 4"
	classVersion < 4 ifTrue: [^ self].
	self initFieldsNamed: #(
		sliderMin
		sliderMax
	) from: anObjStream.

	"fields added in version 5"
	classVersion < 5 ifTrue: [^ self].
	self initFieldsNamed: #(
		isLarge
	) from: anObjStream.
