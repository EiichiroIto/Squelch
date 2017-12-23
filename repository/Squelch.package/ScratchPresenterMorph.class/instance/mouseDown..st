event handling
mouseDown: evt
	"There are three possible cases: drag a sprite, and adjust a slider, and do nothing. To drag a sprite, set mouseFocus to the sprite and dragOffset to the cursor offset the sprite's position. To adjust a slider, set the mouseFocus to the slider and dragOffset to nil. To do nothing, set both to nil."

	| p adjustedEvt rootM |
	mouseFocus := nil.
	dragOffset := nil.
	clickWasHandled := false.
	mouseMoved := false.
	evt hand toolType: nil.

	p := mouseDownPoint := stage adjustedCursorPoint.
	adjustedEvt := evt copy setPosition: p.

	rootM := stage submorphs
		detect: [:m | (m containsPoint: p) & m isVisible]
		ifNone: [
			(stage containsPoint: p) ifTrue: [stage click: adjustedEvt].
			clickWasHandled := true.
			^ self].

	(rootM isKindOf: ScratchSpriteMorph) ifTrue: [
		rootM draggable
			ifTrue: [
				rootM comeToFront.
				mouseFocus := rootM.
				dragOffset := rootM position - p]
			ifFalse: [
				rootM click: adjustedEvt.
				clickWasHandled := true].
		^ self].

	(rootM unlockedMorphsAt: p) do: [:m |
		(m handlesMouseDown: adjustedEvt) ifTrue: [
			mouseFocus := m.
			dragOffset := nil.
			mouseFocus mouseDown: adjustedEvt.
			^ self]].


