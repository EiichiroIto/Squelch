menu/button actions
writeSummaryTotalsOn: aStream
	"Write the totals for this project on the given stream."

	| sprites uniqueCostumes uniqueSounds stackCount |
	sprites := workPane submorphs select: [:m | m isKindOf: ScriptableScratchMorph].
	sprites := sprites asArray copyWith: workPane.
	uniqueCostumes := IdentitySet new: 100.
	uniqueSounds := IdentitySet new: 100.
	stackCount := 0.
	sprites do: [:m |
		m media do: [:item |
			item isImage ifTrue: [uniqueCostumes add: item form].
			item isSound ifTrue: [uniqueSounds add: item sound]].
		stackCount := stackCount + m blocksBin submorphCount].

	aStream nextPutAll: 'Totals: '; crlf.
	aStream nextPutAll: '    Sprites: ', (sprites size - 1) printString; crlf.
	aStream nextPutAll: '    Stacks: ', stackCount printString; crlf.
	aStream nextPutAll: '    Unique costumes: ', uniqueCostumes size printString; crlf.
	aStream nextPutAll: '    Unique sounds: ', uniqueSounds size printString; crlf.
