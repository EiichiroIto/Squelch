private
blockAttachPoints: aSet
	"Answer a collection of possible attachment points for me. Each entry is an Association mapping a point to the morph to which a dropping command block could be attached."

	| result |

	result := #().
	(self isKindOf: HatBlockMorph) ifFalse: [
		ScratchTranslator isRTL
			ifTrue: [result := result copyWith: (self topRight -> self)]
			ifFalse: [result := result copyWith: (self topLeft -> self)]].

	nestedBlock
		ifNil: [ScratchTranslator isRTL
			ifTrue: [result := result copyWith: ((self topRight + (-12@(self topBarHeight + 7))) -> self)]
			ifFalse: [result := result copyWith: ((self topLeft + (12@(self topBarHeight + 7))) -> self)]]
		ifNotNil: [nestedBlock blockAttachPoints: aSet].

	nextBlock
		ifNil: [self isStopOrForever ifFalse: [ScratchTranslator isRTL
			ifTrue: [result := result copyWith: (self bottomRight -> self)]
			ifFalse: [result := result copyWith: (self bottomLeft -> self)]]]
		ifNotNil: [nextBlock blockAttachPoints: aSet].

	aSet addAll: result.
