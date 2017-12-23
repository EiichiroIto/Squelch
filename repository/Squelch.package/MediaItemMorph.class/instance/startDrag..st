event handling
startDrag: evt

	(self meOrOwnerThatIsA: ScratchScriptEditorMorph)
		ifNil: [evt hand grabMorph: self]
		ifNotNil: [evt hand attachMorph: self fullCopy configureForDragging].
