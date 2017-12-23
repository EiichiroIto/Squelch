drawing
areasRemainingToFill: aRectangle
	"Drawing optimization. Since I clip drawing of my submorphs, this method tells Morphic that it isn't necessary to draw any morphs covered by me. This is a little lie because I have rounded corners."
	
	^ aRectangle areasOutside: self bounds
