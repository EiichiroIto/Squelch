other
isSpriteSpecificTarget: anObject selector: selector
	"I determine whether the given selector is specific to a particular Sprite. ."

	| i |
	(anObject isKindOf: ScratchSpriteMorph) ifFalse: [^ false].
	i := selector asString
		findAnySubStr: #('answer' 'key' 'Loud' 'mouse' 'sensor' 'soundLevel' 'tempo' 'timer')
		startingAt: 1.
	^ i > selector asString size
