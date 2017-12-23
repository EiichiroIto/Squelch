accessing
color1: aColor
	"Set the color for painting, ovals, and rectangles. This is also used as the first color when doing gradiant fills."

	| aColor2 |

	aColor2 := aColor.
	(mode == #text) 
		ifTrue: [(aColor == Color transparent) ifTrue: [aColor2 := Color white].
				canvasMorph textColor: aColor2. 
				canvasMorph changed]
		ifFalse: [self storedColor: aColor2].
	colorSwitcher foreground: aColor2.
	(mode == #fill) ifTrue: [self updateOptionsPane].
