accessing
vPan: aNumber
	"Set the up-down pan of my movie. Zero is centered."

	vPan = aNumber ifTrue: [^ self].
	vPan := aNumber.
	self renderingChanged.
