Unicode rendering
formFor: aString font: aStrikeFont fgColor: fgColor bgColor: bgColor suppressAntiAliasing: suppressAntiAliasing
	"Answer a Form containing the given string in the given font and color rendered with the current rendering system. The suppressAntiAliasing flag is useful when the background color is not constant, such as when part of the text is highlighted during editing. Answer nil if no rendering system is available."
	"(self formFor: 'Hello, Scratch!' font: (StrikeFont fontName: 'VerdanaBold' size: 48) fgColor: Color black bgColor: Color blue) display"

	| f s |
	RenderPlugin ifNil: [^ nil].

	self setFont: aStrikeFont antialias: (RenderAntiAliasing & suppressAntiAliasing not).
	RenderAntiAliasing
		ifTrue: [RenderPlugin setColorFG: fgColor BG: bgColor bgTransparent: true]
		ifFalse: [RenderPlugin setColorFG: fgColor BG: Color transparent bgTransparent: true].
 
	s := aString.
	s isUnicode ifTrue: [s := s asUTF8].  "convert from UTF32 to UTF8 if necessary"
	f := Form extent: (RenderPlugin primMeasureString: s) depth: 32.
	RenderPlugin drawString: s on: f.
	^ f
