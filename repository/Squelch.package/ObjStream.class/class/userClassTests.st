testing
userClassTests
	"Test conversions for fixed-format objects."
	"self initialize; userClassTests"

	| userClassList suspectClasses |
	userClassList := self userClasses collect: [:rec | Smalltalk at: rec second].
	userClassList := userClassList reject: [:cl | (cl inheritsFrom: BlockMorph) | (cl inheritsFrom: ArgMorph)].
	userClassList do: [:cl | self serializeAndDeserialize: cl new].

	suspectClasses := userClassList select: [:cl |
		(cl includesSelector: #fieldsVersion) not and: [cl instVarNames size > 0]].
	suspectClasses size > 0 ifTrue: [^ self error: 'not all classes implement #fieldsVersion'].

	self inform: 'User class tests passed.'.

