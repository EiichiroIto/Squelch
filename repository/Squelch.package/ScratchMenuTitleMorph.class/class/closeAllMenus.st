as yet unclassified
closeAllMenus

	self menuBarIsActive ifFalse: [^self ].
	World submorphs do: [:m |
		(m isKindOf: MenuMorph) ifTrue: [m deleteIfPopUp]].
	MenuBarIsActive := false.
