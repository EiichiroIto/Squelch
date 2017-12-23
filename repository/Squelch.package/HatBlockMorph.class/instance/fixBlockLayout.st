private
fixBlockLayout
	"Update the positions of my submorphs."

	| x centerY nextB nonBlockSubmorphs oldExtent oldPos |
	blockLayoutNeeded ifFalse: [^ self].
	super fixBlockLayout.
	oldExtent := self extent.
	oldPos := self position.

	ScratchTranslator isRTL
		ifTrue: [x := self right - 8]
		ifFalse: [x := self left + 8].
	centerY := self top + 25.
	self nonControlFlowSubmorphs do: [:m |
		(m isKindOf: ArgMorph) ifTrue: [m fixArgLayout].
		ScratchTranslator isRTL
			ifTrue: [m position: (x - m width)@(centerY - (m height // 2)). 
				x := x - m width - 5]
			ifFalse: [m position: x@(centerY - (m height // 2)). 
				x := x + m width + 5]].
	ScratchTranslator isRTL
		ifTrue: [x := x - 4.
			self width: ((self right - x) max: self hatTopForm width)]
		ifFalse: [x + x + 4.
			self width: ((x - self left) max: self hatTopForm width)].
	ScratchTranslator isRTL ifTrue: [
		self left: oldPos x + (oldExtent x - self width)].

	nonBlockSubmorphs := self submorphs select: [:m |
		(m isKindOf: BlockMorph) not or: [m isKindOf: ArgMorph]].
	self height: self hatTopForm height + (nonBlockSubmorphs inject: CBlockBracketThickness into: [:h :m | h max: (m height + 8)]).

	(nextB := self nextBlock) ifNotNil: [
		ScratchTranslator isRTL
			ifTrue: [nextB right: self right]
			ifFalse: [nextB left: self left].
		nextB top: self bottom - 4.
		nextB fixBlockLayout].
