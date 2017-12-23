event handling
mouseDown: evt

	| list p ownerList i |
	self isInWorld ifFalse: [^ self].  "not editable in presentation mode"
	super mouseDown: evt.
	p := evt cursorPoint.

	(list := self meOrOwnerThatIsA: ScratchListMorph)
		ifNotNil: [list focusCell: owner].

	ownerList := self meOrOwnerThatIsA: ScratchListMorph.
	((deleteMorph bounds expandBy: 4) containsPoint: p) ifTrue: [
		(ownerList notNil) ifTrue: [
			i := ownerList indexOfCell: self owner.
			ownerList deleteLineAt: i.
			(ownerList listContents size > (i - 1))
				ifTrue: [ownerList focusIndex: i]
				ifFalse: [ownerList focusIndex: i - 1]]].
