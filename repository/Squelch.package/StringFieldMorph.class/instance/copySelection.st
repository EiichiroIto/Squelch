text editing
copySelection
	"Save the current selection in the clipboard."

	| s |
	s := stringMorph contents 
		copyFrom: self leftSelection + 1 
		to: self rightSelection.
	s size = 0 ifTrue: [^ self].
	ScratchTranslator unicodeClipboardPut: s.
