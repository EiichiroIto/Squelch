scratch skin
isXO: aBoolean
	"Set the current skin style to #XO if the argument is true, normal otherwise."
	"self isXO: true"
	"self isXO: false"

	IsXO := aBoolean.

	"aBoolean ifTrue: [(Preferences setMenuFontTo: (StrikeFont fontName: #VerdanaBold size: 18))]
			ifFalse: [(Preferences restoreDefaultFonts)]." "annoying for development"
