language translation
varSpecTranslationFor: spec varName: varName
	"Return the translation of a variable setter command spec for the given variable."

	| s i |
	s :=  ScratchTranslator translationFor: spec.
	i := s indexOfSubCollection: '%v' startingAt: 1.
	^ (s copyFrom: 1 to: i - 1), varName, (s copyFrom: (i + 2) to: s size).
