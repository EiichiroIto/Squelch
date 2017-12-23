accessing
heading: headingDegrees
	"Set my heading in degrees, where 0 degrees is facing up and the heading increases clockwise."
	"Note: Our convention is that artwork is drawing facing to the right. Thus, a heading of 90 corresponds to a rotationDegrees of zero."

	self rotationDegrees: headingDegrees - 90
