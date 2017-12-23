accessing
blockID
	"answer a temporary (!) id for the receiver
	which can be used for tuple conversion of
	sticky comments"

	| sm |
	sm := self meOrOwnerThatIsA: ScratchScriptsMorph.
	sm ifNil: [^ nil].
	^ (sm allMorphs select: [:m |
		m isKindOf: BlockMorph]) indexOf: self
