accessing
target: aScratchObjectOrNil
	"Start viewing the given object or no object."

	| sFrame nameSel |
	World activeHand newKeyboardFocus: nil.
	(aScratchObjectOrNil isNil or:
	 [aScratchObjectOrNil isScriptable not]) ifTrue: [
		thumbnailMorph target: nil.
		nameMorph target: nil; contents: 'no object '.
		pageViewerMorph contents: (Morph new color: Color red).

		(sFrame := self meOrOwnerThatIsA: ScratchFrameMorph) ifNotNil: [
			sFrame viewerPane target: nil].

		self showOrHideReadouts.
		^ self].

	thumbnailMorph target: aScratchObjectOrNil.

	nameSel := (aScratchObjectOrNil isKindOf: ScratchStageMorph)
		ifTrue: [nil]
		ifFalse: [#objName:].
	nameMorph
		target: aScratchObjectOrNil;
		getSelector: #objName;
		putSelector: nameSel.

	self showOrHideReadouts.
	self fixLayout.
