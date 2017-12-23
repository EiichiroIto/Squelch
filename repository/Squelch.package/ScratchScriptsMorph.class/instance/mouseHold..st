event handling
mouseHold: evt

	| m |
	(m := self meOrOwnerThatIsA: ScratchScriptEditorMorph) ifNil: [^ self].
	(m target notNil and: [m currentCategory = 'Scripts'])
		ifTrue: [m scriptsMenu: evt hand position].
