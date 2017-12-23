drawing
areasRemainingToFill: aRectangle
	"Drawing optimization. This method tells Morphic that it isn't necessary to draw any morphs covered by me. (My bounds must be inset due to my rounded corners)."
	
	^ aRectangle areasOutside: (self bounds insetBy: 16)
