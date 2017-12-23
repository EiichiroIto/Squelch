accessing
options
	"Answer my set of attributes."

	| target |
	((owner isKindOf: CommandBlockMorph) and:
	 [owner selector = #getAttribute:of:]) ifFalse: [^ #()].

	(target := (owner argumentAt: 2) evaluate) ifNil: [^ #()].
	(target isKindOf: ScriptableScratchMorph) ifFalse: [^ #()].
	target varNames size > 0
		ifTrue: [^ target attributeNames, #(-), target varNames]
		ifFalse: [^ target attributeNames].
