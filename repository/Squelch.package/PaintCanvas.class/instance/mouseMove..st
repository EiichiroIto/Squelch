event handling
mouseMove: evt
	"Draw and/or give feedback."

	| screenP |
	((#paint ~= palette mode) & (ScratchFrameMorph isXO not))
		ifTrue: [self autoScroll: evt cursorPoint].

	palette showRotationCenter ifTrue: [
		screenP := evt cursorPoint adhereTo: (self topLeft corner: self bottomRight - 1).
		registrationPoint := self screenToCanvas: screenP.
		^ self changed].

	#text = palette mode ifTrue: [^ self textMouseMove: evt].

	self dragTo: (self screenToCanvas: evt cursorPoint).
