event handling
click: evt

	evt hand toolType = 'CutTool' ifTrue: [
		evt shiftPressed ifFalse: [evt hand toolType: nil].
		(owner isKindOf: ScratchBlockPaletteMorph) ifTrue: [^ self].  "ignore if in palette"
		ScratchFrameMorph putInClipboard: self.
		^ self stop; delete].

	super click: evt.
