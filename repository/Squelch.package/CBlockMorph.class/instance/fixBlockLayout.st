drawing
fixBlockLayout
	"Update the positions of my submorphs."

	| oldExtent newW newH f |
	blockLayoutNeeded ifFalse: [^ self].
	super fixBlockLayout.

	"fix nestedBlock and nextBlock in case they've been removed from me"
	(nestedBlock notNil and: [nestedBlock owner ~~ self]) ifTrue: [nestedBlock := nil].
	(nextBlock notNil and: [nextBlock owner ~~ self]) ifTrue: [nextBlock := nil].

	oldExtent := self extent.
	newW := oldExtent x max: 40.
	newH := self topBarHeight + CBlockBracketThickness.
	self isForever ifFalse: [newH := newH + 4].

	nestedBlock
		ifNil: [newH := newH + 14]
		ifNotNil: [
			stretchHeight := 0.
			nestedBlock fixBlockLayout.
			newH := newH + nestedBlock fullBounds height - 1.
			ScratchTranslator isRTL
				ifTrue: [nestedBlock position: self topRight - ((CBlockBracketThickness + nestedBlock width)@0)
					+ (0@(self topBarHeight + 3))]
				ifFalse: [nestedBlock position: self position + (CBlockBracketThickness@(self topBarHeight + 3))].
			nestedBlock blockSequence last isStopOrForever ifTrue: [newH := newH + 4]].
	self extent: newW@newH + (0@stretchHeight).
	ScratchTranslator isRTL ifTrue: [
		self left: self left + (oldExtent x - newW)].

	"position loop morph"
	loopMorph ifNotNil: [
		f := ScratchFrameMorph skinAt: #loopIcon.
		ScratchTranslator isRTL
			ifTrue: [loopMorph form: (f flipBy: #horizontal centerAt: f center)]
			ifFalse: [loopMorph form: f].
		self isForever
			ifTrue: [ScratchTranslator isRTL
				ifTrue: [loopMorph position: self bottomLeft + (4@0) - (0@(loopMorph height + 2))]
				ifFalse: [loopMorph position: self bottomRight - loopMorph extent - (4@2)]]
			ifFalse: [ScratchTranslator isRTL
				ifTrue: [loopMorph position: self bottomLeft + (4@0) - (0@(loopMorph height + 6))]
				ifFalse: [loopMorph position: self bottomRight - loopMorph extent - (4@6)]]].

	nextBlock ifNotNil: [
		ScratchTranslator isRTL
			ifTrue: [nextBlock position: (self right - nextBlock width)@(self bottom - 4)]
			ifFalse: [nextBlock position: self left@(self bottom - 4)]].
