geometry
extent: aPoint
	"Position all my submorphs whenever I get resized."

	super extent: aPoint.
	self fixLayout.
