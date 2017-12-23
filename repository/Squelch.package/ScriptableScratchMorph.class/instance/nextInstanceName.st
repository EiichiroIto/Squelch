private
nextInstanceName
	"Answer a name for a new instance. For sprites, an attempt is made to create a unique name of the form 'spriteN'."

	| stage lastN digits |
	self = ScratchStageMorph ifTrue: [^ 'Stage' localized].

	(stage := self meOrOwnerThatIsA: ScratchStageMorph) ifNil: [^ 'Sprite' localized, 1 printString].
	lastN := 0.
	stage sprites ifNotNil: [
		stage sprites do: [:m |
			(m isKindOf: ScratchSpriteMorph) ifTrue: [
				digits := m objName trailingDigits.
				((digits size > 0) and: [m objName beginsWith: ('Sprite' localized)])
					ifTrue: [lastN := lastN max: digits asNumber]]]].

	^ 'Sprite' localized, (lastN + 1) printString
