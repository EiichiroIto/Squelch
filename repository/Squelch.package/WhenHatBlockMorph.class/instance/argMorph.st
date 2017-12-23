other
argMorph

	submorphs do: [:m |
		(m isKindOf: ArgMorph) ifTrue: [^ m].
		(m isKindOf: ReporterBlockMorph) ifTrue: [^ m]].
	^ nil
