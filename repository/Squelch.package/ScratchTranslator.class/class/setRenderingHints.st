Unicode rendering
setRenderingHints
	"Set optional rendering hints from fields in the translation file header. If a given hint is not explicitly set by the header, set it to its default value."

	| s |
	"default values:"
	IsRTL := false.
	IsRTLMath := false.
	"RenderAntiAliasing := false.""Smalltalk isMacOSX."
	RenderFont := nil.
	RenderHintString := nil.
	RenderScale := 1.
	RenderSuppressBold := false.
	RenderCenterOffsetCache := IdentityDictionary new.
	RenderVerticalTrimCache := IdentityDictionary new.
	RenderWithSqueak := true.

	TranslationDict isEmpty ifTrue: [^ self].

	(TranslationDict includesKey: 'Language-Direction') ifTrue: [
		IsRTLMath := (TranslationDict at: 'Language-Direction') asString asUppercase = 'RTL-MATH'.
		IsRTLMath
			ifTrue: [IsRTL := true]
			ifFalse: [IsRTL := (TranslationDict at: 'Language-Direction') asString asUppercase = 'RTL']].

	Smalltalk os isWindows ifTrue: [
		((TranslationDict includesKey: 'Win-Font') and: [(TranslationDict at: 'Win-Font') size > 0])
			ifTrue: [RenderFont := TranslationDict at: 'Win-Font']].

	Smalltalk os isMacOSX ifTrue: [
		((TranslationDict includesKey: 'Mac-Font') and: [(TranslationDict at: 'Mac-Font') size > 0])
			ifTrue: [RenderFont := TranslationDict at: 'Mac-Font']].

	(Smalltalk os isWindows | Smalltalk os isMacOSX) ifFalse: [
		((TranslationDict includesKey: 'Linux-Font') and: [(TranslationDict at: 'Linux-Font') size > 0])
			ifTrue: [RenderFont := TranslationDict at: 'Linux-Font']].

	s := TranslationDict at: 'Font-Scale' ifAbsent: [''].
	s size > 0 ifTrue: [
		RenderScale := s asString asNumberNoError.
		RenderScale = 0 ifTrue: [RenderScale := 1].  "non-number string"
		RenderScale := RenderScale min: 2.5 max: 0.5].

	s := TranslationDict at: 'Suppress-Bold' ifAbsent: [''].
	s size > 0 ifTrue: [s asString asLowercase = 'true' ifTrue: [RenderSuppressBold := true]].

	"even though we are not actively using the hint string, keep this code in case we need it in the future:"
	s := TranslationDict at: 'Layout-Hint' ifAbsent: [''].
	s size > 0 ifTrue: [RenderHintString := s].

	RenderWithSqueak := false.
