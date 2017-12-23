drawing-optimization
updateCachedForm
	"Create a cached Form of this stack's appearance."

	| c offset |
	oldColor ifNotNil: [color := oldColor].
	c := FormCanvas extent: self fullBounds extent depth: 32.
	ScratchTranslator isRTL
		ifTrue: [
			offset := scratchProc ifNil: [0@0] ifNotNil: [3@3].
			c := c copyOffset: (self fullBounds topLeft + offset) negated]
		ifFalse: [c := c copyOffset: self topLeft negated].
	self drawOn: c.
	self drawSubmorphsOn: c.
	cachedForm := c form.
	lastLayoutTime := Time millisecondClockValue.
