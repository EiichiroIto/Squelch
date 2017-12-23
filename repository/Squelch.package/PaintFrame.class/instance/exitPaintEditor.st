other
exitPaintEditor

	scratchFrame ifNotNil: [scratchFrame paintingInProgress: false].
	World ifNotNil: [World activeHand "turnOffGridding;" showTemporaryCursor: nil].
