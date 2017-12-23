import/export
verifyTranslationFilesArgOrder
	"Returns a dictionary with any language file with invalid arguments as the key and the invalid arguments as the value"
	"self verifyTranslationFilesArgOrder2"

	| verificationDict dict subDict ts argsS argsTS |
	verificationDict := Dictionary new.
	self translationDir fileNames do: [: n |
		dict := self importTranslation: n.
		subDict := Dictionary new.
		ScriptableScratchMorph blockSpecsForTranslation do: [:s |
			ts := dict at: s ifAbsent: [s].
			argsS := (CommandBlockMorph parseCommandSpec: s) select: [:a | CommandBlockMorph isArgSpec: a].
			argsTS := (CommandBlockMorph parseCommandSpec: ts) select: [:a | CommandBlockMorph isArgSpec: a].
			(argsS sort = argsTS sort)
				ifFalse: [(ts size > 0) ifTrue: [subDict at: s put: ts]]].
		(subDict values size > 0)
			ifTrue: [verificationDict at: n put: subDict]].

	^ verificationDict
