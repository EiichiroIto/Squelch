menu/button actions
exitScratchSession
	"Close all connections to remote collaborators."

	workPane scratchServer ifNil: [^ self].
	workPane scratchServer endScratchSession.
	workPane scratchServer: nil.
