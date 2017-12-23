dropping/grabbing
justDroppedInto: newOwner event: evt
	"Handle being dropped into a new situation."

	| frame target |
	(frame := newOwner meOrOwnerThatIsA: ScratchFrameMorph)
		ifNotNil: [frame projectModified].

	((self meOrOwnerThatIsA: ScratchViewerMorph) notNil) ifTrue: [
		"delete myself when dropped in the blocks palette area"
		self delete.
		^ self].

	"comments cannot be dropped onto the stage"
	(owner isKindOf: ScratchStageMorph) ifTrue: [
		^ self rejectDropEvent: evt].

	"okay to drop comments into the world during development"
	(owner == World) ifTrue: [^ self].

	(owner isKindOf: ScratchScriptsMorph) ifFalse: [
		^ self rejectDropEvent: evt].

	target := self attachTargetIn: newOwner.
	target ifNotNil: [self anchor: target]
