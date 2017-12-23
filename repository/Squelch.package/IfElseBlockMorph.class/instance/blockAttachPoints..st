private
blockAttachPoints: aSet
	"Answer a collection of possible attachment points for me. Each entry is an Association mapping a point to the morph to which a dropping command block could be attached."

	| result |
	result := #().
	self = self topBlock ifTrue: [result := result copyWith: self topLeft -> self].

	(self isKindOf: HatBlockMorph) ifFalse: [
		ScratchTranslator isRTL
			ifTrue: [result := result copyWith: (self topRight -> self)]
			ifFalse: [result := result copyWith: (self topLeft -> self)]].

	trueBlock
		ifNil: [ScratchTranslator isRTL
			ifTrue: [result := result copyWith: ((self right - 12)@(self top + self topBarHeight + 7)) -> self]
			ifFalse: [result := result copyWith: (self topLeft + (12@(self topBarHeight + 7))) -> self]]
		ifNotNil: [trueBlock blockAttachPoints: aSet].

	falseBlock
		ifNil: [ScratchTranslator isRTL
			ifTrue: [result := result copyWith: ((self right - 12)@(self top + elseBarY + self elseBarHeight + 9)) -> self]
			ifFalse: [result := result copyWith: (self topLeft + (12@(elseBarY + self elseBarHeight + 9))) -> self]]
		ifNotNil: [falseBlock blockAttachPoints: aSet].

	nextBlock
		ifNil: [ScratchTranslator isRTL
			ifTrue: [result := result copyWith: self bottomRight -> self]
			ifFalse: [result := result copyWith: self bottomLeft -> self]]
		ifNotNil: [nextBlock blockAttachPoints: aSet].

	aSet addAll: result.
