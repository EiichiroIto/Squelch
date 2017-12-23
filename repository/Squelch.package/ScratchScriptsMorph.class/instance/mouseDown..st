event handling
mouseDown: evt

	| m |
	evt hand newKeyboardFocus: nil.

	evt hand toolType ifNotNil: [
		"revert to normal cursor"
		evt hand toolType: nil.
		^ self].

	evt yellowButtonPressed ifTrue: [
		Sensor waitNoButton.
		(m := self meOrOwnerThatIsA: ScratchScriptEditorMorph) ifNil: [^ self].
		(m target notNil and: [m currentCategory = 'Scripts'])
			ifTrue: [m scriptsMenu: evt hand position].
		^ self].

	evt hand waitForClicksOrDrag: self event: evt.
