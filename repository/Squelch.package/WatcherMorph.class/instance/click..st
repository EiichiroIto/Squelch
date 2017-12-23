event handling
click: evt

	evt hand toolType = 'CutTool' ifTrue: [
		evt shiftPressed ifFalse: [evt hand toolType: nil].
		ScratchFrameMorph putInClipboard: self.
		self aboutToBeGrabbedBy: evt hand.
		self delete].
