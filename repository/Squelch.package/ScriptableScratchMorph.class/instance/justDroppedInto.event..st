dropping/grabbing
justDroppedInto: newOwner event: evt
	"If I'm dropped into any submorph of a ScratchFrameMorph, reject the drop unless it is onto the work pane. For developers, accept drops into other morphs (e.g. the World). Otherwise, reject the drop."

	| sFrame |
	(sFrame := newOwner meOrOwnerThatIsA: ScratchFrameMorph) ifNotNil: [
		newOwner = sFrame viewerPane pageViewer contents ifTrue: [
			self undoableDeleteSprite.
			sFrame libraryPane step.
			^ self].

		newOwner = sFrame workPane ifTrue: [^ self]. "allow drops onto the work pane"
		^ self rejectDropEvent: evt].

	false ifTrue: [^ self rejectDropEvent: evt].
