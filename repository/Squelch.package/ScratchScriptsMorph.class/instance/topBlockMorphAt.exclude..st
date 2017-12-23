stepping
topBlockMorphAt: aPoint exclude: aMorph
	"Give feedback about possible drop targets."

	| stack answer blocksUnderHand |
	stack := submorphs
		detect: [:m | (m isKindOf: BlockMorph) and: [m fullBounds containsPoint: aPoint]]
		ifNone: [^ nil].

	blocksUnderHand := OrderedCollection new.
	stack allMorphsDo: [:s | ((s isKindOf: BlockMorph) and: [s bounds containsPoint: aPoint]) 
		ifTrue: 	[blocksUnderHand addLast: s]
	].
	
	(blocksUnderHand isEmpty) ifTrue: [^ nil]
	ifFalse: [answer := blocksUnderHand first. ^ answer]	

