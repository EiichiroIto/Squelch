accessing
fade: aNumber
	"Set the opacity of the fade color. The range is 0-100, where 0 means no fade and 100 means the fade color completely hides the image."

	| newFade |
	newFade := ((aNumber asFloat min: 100.0) max: 0.0) truncated.
	newFade = fade ifTrue: [^ self].
	fade := newFade.
	self renderingChanged.
