private
extractProjectFrom: aByteArray
	"Answer a Scratch project (i.e. a ScratchStageMorph possibly containing sprites) from the given ByteArray. Answer nil if the project cannot be unpacked."

	| s version proj |
	s := ReadStream on: aByteArray.
	version := ObjStream scratchFileVersionFrom: (s next: 10) asString.
	version = 0 ifTrue: [
		s position: 0.
		proj := ObjStream new readObjFrom: s showProgress: true].
	(version = 1) | (version = 2) ifTrue: [
		s skip: s uint32.  "skip header"
		proj := ObjStream new readObjFrom: s showProgress: true].

	proj class = ScratchStageMorph ifFalse: [
		version > 2
			ifTrue: [self error: 'Project created by a later version of Scratch']
			ifFalse: [self error: 'Problem reading project.'].
		^ nil].

	ScriptableScratchMorph buildBlockSpecDictionary.
	proj allMorphsDo: [:m |
		(m isKindOf: ScriptableScratchMorph) ifTrue: [  "covert to new blocks"
			m convertStacksToTuples.
			m convertTuplesToStacks]].

	^ proj
