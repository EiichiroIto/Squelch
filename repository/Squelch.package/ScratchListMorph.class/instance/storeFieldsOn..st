object i/o
storeFieldsOn: anObjStream
	"Note: To simplify my representation in the project file, my submorphs are removed before saving and restored when I am read in from an object file."

	| strings |
	strings := cellMorphs asArray collect: [:m | m firstSubmorph contents].
	self removeAllMorphs.
	numberMorphs := #().

	super storeFieldsOn: anObjStream.
	anObjStream putField: listName.
	anObjStream putField: strings.
	anObjStream putField: target.

	self addTitleAndControls; addScrollPane.
	titleMorph contents: listName.
	self newContents: strings.
	self fixLayout.

