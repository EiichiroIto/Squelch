Unicode rendering
setFont: aStrikeFont antialias: antialiasFlag

	| font isBold fontName fontSize |
	font := aStrikeFont.
	font ifNil: [font := StrikeFont fontName: 'Times' size: 14].

	fontName := font name.
	fontSize := (font pointSize * RenderScale) rounded.
	isBold := false.

	(fontName asLowercase endsWith: 'bold') ifTrue: [
		fontName := fontName copyFrom: 1 to: (fontName size - 4).
		isBold := true].

	aStrikeFont isOSFont ifFalse: [
		(fontName beginsWith: 'VerdanaBoldNarrowSpace') ifTrue: [
			fontName := 'Verdana'.
			isBold := true].

		(fontName beginsWith: 'Times') ifTrue: [ "Squeak font; not used by Scratch"
			fontName := 'Comic'.
			fontSize := font pointSize + 1].

		RenderFont ifNotNil: [fontName := RenderFont].
		RenderSuppressBold ifTrue: [isBold := false]].

	RenderPlugin
		primSetFont: fontName
		size: fontSize
		bold: isBold
		italic: false
		antialias: antialiasFlag.
