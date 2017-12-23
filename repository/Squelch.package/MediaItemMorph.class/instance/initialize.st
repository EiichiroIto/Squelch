initialization
initialize
 
	super initialize.
	topRightInset := 17@10.
	self extent: 285@81.
	self color: Color transparent.
	"this determines how far in in x and y the thumbnailMorph should be inside of the highlight when selected"
	highlightPadding := 20@5.
	"this determines the minimum size of the thumbnail. The thumbnail may grow larger with larger font sizes"
	minThumbHeight := 56.
