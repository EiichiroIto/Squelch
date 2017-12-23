accessing
scratchObjects
	"Answer a collection of all the scratch objects in the work pane."

	^ self workPane submorphs select: [:m | m isKindOf: ScriptableScratchMorph]
