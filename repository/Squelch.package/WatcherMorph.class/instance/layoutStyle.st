accessing
layoutStyle
	"Return a symbol indicating my current layout type: small, slider, large."

	scratchSlider notNil ifTrue: [^ #slider].
	^ self isLarge ifTrue: [#large] ifFalse: [#small]
