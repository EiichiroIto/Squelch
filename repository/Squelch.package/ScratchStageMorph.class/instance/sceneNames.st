looks ops
sceneNames

	| setOfNames |
	setOfNames := Set new.
	submorphs do: [:m |
		(m isKindOf: ScratchSpriteMorph) ifTrue: [
			setOfNames addAll: m scenes]].

	^ setOfNames asArray sort, (Array
		with: '-'
		with: 'record' localized, ScratchTranslator ellipsesSuffix
		with: 're-record' localized, ScratchTranslator ellipsesSuffix)
