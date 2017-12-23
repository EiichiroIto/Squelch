accessing
pbFillStyle: aSymbol
	"Set the paint bucket fill style: color, erase, hGradient, vGradient, or rGradient."

	pbFillStyle := aSymbol.
	fillStylePane ifNil: [^ self].
	self updateOptionsPane.
