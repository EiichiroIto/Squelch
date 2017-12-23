private
tab: aResizableToggleButton2 label: aString

	| label |
	aResizableToggleButton2
		label: aString font: (ScratchFrameMorph getFont: #Tab).

	ScratchTranslator renderWithSqueak ifFalse: [
		aResizableToggleButton2 forceUnicodeRendering: true].

	"account for the size of the tab skin."
	aResizableToggleButton2 extent: (aResizableToggleButton2 extent - (0@10)).

	(label := aResizableToggleButton2 findA: StringMorph) ifNotNil: [
		"slide label up a little"
		label top: label top].
