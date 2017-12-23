Unicode rendering
useSqueakRendering
	"Answer true if the current langauge can (or must) be rendered using Squeak,based on the availablility of a rendering plugin, the settings in the .po file and the contents of the translations. Assume that the header has already been processed to initialize HeaderDict."

	self canRenderUnicode ifFalse: [^ true].

	IsRTL ifTrue: [^ false].
	RenderScale ~= 1 ifTrue: [^ false].
	RenderSuppressBold ifTrue: [^ false].

true ifTrue: [^ false].  "disable Squeak rendering, even if language can be represented in MacRoman"

	TranslationDict associationsDo: [:assoc |
		((assoc key endsWith: '-comment') not and:
		 [(assoc key asLowercase = 'language-name') not and:
		 [assoc value isUnicode]]) ifTrue: [
			assoc value isMacRoman ifFalse: [^ false]]].

	^ true
