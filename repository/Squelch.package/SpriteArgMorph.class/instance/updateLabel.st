stepping
updateLabel
	"Update my label string."

	| s |
	self checkForDeletedMorph.
	s := ' '.
	(morph isKindOf: ScriptableScratchMorph) ifTrue: [s := morph objName].
	(morph isKindOf: String) ifTrue: [
		s := morph localized.
		morph = #mouse ifTrue: [s := 'mouse-pointer' localized]].

	labelMorph contents = s ifFalse: [
		labelMorph contents: s.
		labelMorph position: self position + borderWidth + (3 @ -1).
		self extent: (labelMorph extent + (16@2) + borderWidth).
		menuIconMorph position: (self right - borderWidth - 10)@(self top + borderWidth + 4).
		(self meOrOwnerThatIsA: ScratchBlockPaletteMorph) ifNotNil: [
			(self meOrOwnerThatIsA: ScratchBlockPaletteMorph) fixLayout]].
