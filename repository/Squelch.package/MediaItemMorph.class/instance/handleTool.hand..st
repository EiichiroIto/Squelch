event handling
handleTool: toolName hand: hand

	toolName = 'CopyTool' ifTrue: [
		Sensor shiftPressed ifFalse: [hand toolType: nil].
		^ self duplicateMedia].

	toolName = 'CutTool' ifTrue: [
		Sensor shiftPressed ifFalse: [hand toolType: nil].
		self delete.
		ScratchFrameMorph putInClipboard: self configureForDragging.
		^ self deleteMedia].
