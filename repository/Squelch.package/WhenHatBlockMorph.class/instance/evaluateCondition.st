other
evaluateCondition
	"Answer true if my condition is true."

	| arg |
	arg := submorphs detect: [:m | m isKindOf: ReporterBlockMorph] ifNone: [^ false].
	^ arg evaluate
