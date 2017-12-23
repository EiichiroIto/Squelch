private
updateTargetName
	"Check if I should display my target's name."

	| targetName |
	(self meOrOwnerThatIsA: HandMorph) ifNotNil: [^ self].  "do nothing when in a HandMorph"
	isLarge ifTrue: [^ self].  "don't show target or var name if large readout showing"

	targetName := readout target objName.
	(lastTargetName = targetName) ifTrue: [^ self].  "no change"

	isSpriteSpecific
		ifTrue: [titleMorph contents: targetName, ' ', self translatedName]
		ifFalse: [titleMorph contents: self translatedName].

	lastTargetName := targetName.
