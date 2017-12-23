accessing
fillStyle: aSymbol
	"Set the paint bucket fill style: color, erase, hGradient, vGradient, or rGradient."

	fillStyle := aSymbol.
	fillStylePane ifNil: [^ self].
	self updateOptionsPane.
