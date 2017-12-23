dropping/grabbing
justDroppedInto: aMorph event: evt
	"When I am dropped into the viewer pane or the script editor, then delete the sprite associated with me."

	self delete.
true ifTrue: [^ self].

	"delete me when dropped on the blocks palette or the script editor"
	(((aMorph meOrOwnerThatIsA: ScratchViewerMorph) notNil) 
		or: [(aMorph meOrOwnerThatIsA: ScratchScriptEditorMorph) notNil]) ifTrue: [
		^ self target undoableDeleteSprite].

	"blocks cannot be dropped onto the stage"
	(owner isKindOf: ScratchStageMorph) ifTrue: [
		^ self rejectDropEvent: evt].
