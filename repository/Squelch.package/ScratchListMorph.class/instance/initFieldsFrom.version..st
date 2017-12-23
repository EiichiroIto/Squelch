object i/o
initFieldsFrom: anObjStream version: classVersion
	"Note: To simplify my representation in the project file, my submorphs are removed before saving and restored when I am read in from an object file."

	| strings |
	super initFieldsFrom: anObjStream version: classVersion.

	listName := anObjStream nextField.
	strings := anObjStream nextField.
	classVersion > 1 ifTrue: [target := anObjStream nextField].

	self removeAllMorphs.
	self addTitleAndControls; addScrollPane.
	titleMorph contents: listName.
	self newContents: strings.
	self fixLayout.
	self updateContents.
