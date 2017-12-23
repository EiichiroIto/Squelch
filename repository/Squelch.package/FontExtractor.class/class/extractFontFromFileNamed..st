utilities
extractFontFromFileNamed: fileName
	"Extract a font from an image file showing all its letters. (In the old days, printers called this a 'strike' of the font."

	| f |
	f := Form fromFileNamed: fileName.
	^ self new
		extractFontFrom: f
		name: (FileDirectory baseNameFor: (FileDirectory localNameFor: fileName)).
