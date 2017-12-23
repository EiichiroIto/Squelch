drawing
updateNameAndInfo

	| w y |

	self
		setProperty: #balloonText
		toValue: ((target objName, ' (', 'Scripts' localized, ScratchTranslator colonSuffix, ' ', target scripts size printString, ')')).

	nameMorph ifNotNil:[
		(target isKindOf: ScriptableScratchMorph) ifFalse: [
			nameMorph contents: '<no object>'.
			scriptCountMorph contents: ''.
			^ self].

		nameMorph contents = target objName ifFalse: [
			nameMorph contents: self truncatedLabel.
			nameMorph left: self left + ((self width - nameMorph width) // 2) + 1]].

	scriptCountMorph ifNotNil: [
		w := 0.
		target scripts size > 0
			ifTrue: [
				w > 0 ifTrue: [w := w + 2].
				scriptCountMorph contents: 'Scripts' localized, ScratchTranslator colonSuffix, ' ', target scripts size printString.
				w := w + scriptCountMorph width + 2]
			ifFalse: [
				scriptCountMorph contents: ''].

		"layout info morph row"
		y := nameMorph bottom.
		w > 0 ifTrue: [
			scriptCountMorph position: (self left + ((self width - (scriptCountMorph width)) // 2))@y]].
