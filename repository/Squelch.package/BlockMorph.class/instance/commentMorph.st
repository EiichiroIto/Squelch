accessing
commentMorph
	"answer a comment which has been sticked to the receiver, if any"

	| sm |
	sm := self meOrOwnerThatIsA: ScratchScriptsMorph.
	sm ifNil: [^ nil].
	^ sm submorphs detect: [: m |
		(m isKindOf: ScratchCommentMorph) and: [
			m anchor == self]] ifNone: [nil].
