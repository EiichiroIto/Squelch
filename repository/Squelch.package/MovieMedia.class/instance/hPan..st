accessing
hPan: aNumber
	"Set the left-right pan of my movie. Zero is centered."

	hPan = aNumber ifTrue: [^ self].
	hPan := aNumber.
	self renderingChanged.
