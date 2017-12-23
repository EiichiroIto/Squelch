accessing
layoutStyle: aSymbol
	"Set my layout style to one of: #small, #slider, #large."

	self layoutForViewer.
	#slider = aSymbol ifTrue: [^ self showSlider].
	#large = aSymbol ifTrue: [^ self showLargeReadout].
	self showSmallReadout.
