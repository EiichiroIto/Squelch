event handling
handleTool: toolName hand: hand

	| scaleFactor |
	toolName = 'CopyTool' ifTrue: [
		Sensor shiftPressed ifFalse: [hand toolType: nil].
		(self isKindOf: ScratchStageMorph) ifFalse: [
			^ self duplicate]].

	toolName = 'CutTool' ifTrue: [
		Sensor shiftPressed ifFalse: [hand toolType: nil].
		(self isKindOf: ScratchStageMorph) ifFalse: [
			^ self undoableDeleteSprite]].

	"exit now if I am not scalable"
	(self respondsTo: #multiplySizeBy:) ifFalse: [
		self beep.
		hand toolType: nil.
		^ self].

	scaleFactor := hand lastEvent shiftPressed ifTrue: [1.2] ifFalse: [1.03].
	toolName = 'ZoomInTool' ifTrue: [^ self multiplySizeBy: scaleFactor].
	toolName = 'ZoomOutTool' ifTrue: [^ self multiplySizeBy: 1.0 / scaleFactor].
