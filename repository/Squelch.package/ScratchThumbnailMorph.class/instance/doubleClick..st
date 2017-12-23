event handling
doubleClick: evt
	"Set my target to it's normal orientation."

	(target respondsTo: #rotationDegrees:) ifFalse: [^ self].
	target rotationDegrees: 0.
	self updateThumbnail.
