view mode
updatePenPositions
	"Update the pen positions of my sprites when going between normal and presentation mode."

	| stage |
	stage := self workPane.
	ScriptableScratchMorph scratchOrigin: stage center.
	stage submorphsDo: [:m | stage updatePenPositionFor: m].
