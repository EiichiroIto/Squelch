tools (no longer used)
undoTool

	| m newOwner oldName |
	self paintingInProgress ifTrue: [^ self beep].
	Clipboard ifNil: [^ self beep].
	self activeHand toolType: nil.
	m := Clipboard fullCopy.
	"Reset clipboard to empty since an undo just happened"
	
	(m isKindOf: BlockMorph) ifTrue: [
		newOwner := viewerPane target.
		newOwner ifNotNil: [m newScriptOwner: newOwner].
		(viewerPane currentCategory = 'variables') ifTrue: [
			"update 'variables' category if it is showing"
			viewerPane currentCategory: 'variables']].

	(m isKindOf: ScratchSpriteMorph) ifTrue: [  "sprite; add to stage"
		m filterReset; show.
		m objName: Clipboard objName.
		Clipboard := nil.
		oldName := m objName.
		self addAndView: m.
		m objName: oldName.
		^ self].

	"blocks or anything else: attach to hand"
	self activeHand attachMorph: m.
	Clipboard := nil.
