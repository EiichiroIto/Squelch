right button menu
makeVisible
	"Make sure that I am entirely on the screen and visible."

	self visible ifFalse: [self visible: true].
	visibility < 30 ifTrue: [self visibility: 100].
	self scale < 10 ifTrue: [self setSizeTo: 100].
	(owner notNil and: [owner bounds containsPoint: self center]) ifFalse: [
		self referencePosition: 0@0].
	self comeToFront.
	World displayWorldSafely.

	self viewBlocksAndScripts.
