other
fromUser
	"Go into a mode asking the user to select an instance of me, displaying a crossHair cursor while in this mode. The mode ends with the next mouse click. If the click is over an instance of me, return it. Otherwise, return nil. Keep running the world while waiting for the mouse click."

	| result p m mList |
	World ifNil: [^ self].  "not in morphic"
	result := nil.
	Cursor crossHair showWhile: [
		[Sensor anyButtonPressed] whileFalse: [World doOneCycleNoInput].
		p := Sensor cursorPoint.
		m := (World rootMorphsAt: p) first.
		(m isKindOf: ScratchFrameMorph) ifTrue: [
			mList := m workPane rootMorphsAt: p.
			mList size > 0 ifTrue: [
				m := (m workPane rootMorphsAt: p) first]].
		(m isKindOf: self) ifTrue: [result := m].
		Sensor waitNoButton].
	^ result
