event handling
mouseDown: evt

	| rcvr menu choice |
	menuMorph ifNil: [^ super mouseDown: evt].
	(evt cursorPoint x < (menuMorph left - 1)) ifTrue: [^ super mouseDown: evt].

	(getMenuSelector notNil and:
	 [(owner isKindOf: BlockMorph) and: 
	 [(rcvr := owner receiver) notNil]]) ifFalse: [^ self beep].
	menu := rcvr perform: getMenuSelector.
	(menu isKindOf: ScratchNoteSelector) ifTrue: [
		menu position: owner bottomLeft + (((owner width - menu width) // 2) @ -4)].
	menu updateTarget: [ :v | choice := v ].
	menu invokeAt: ActiveHand position in: self world.
	choice ifNil: [^ self].
	evt hand newKeyboardFocus: nil.  "close mini-editor, if any"

	(#(listIndexMenu listIndexForDeleteMenu) includes: getMenuSelector) ifTrue: [
		^ self specialValue: choice].

	isNumber
		ifTrue: [self numExpression: choice]
		ifFalse: [self stringExpression: choice].

