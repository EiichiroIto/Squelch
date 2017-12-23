block specs
blockColorFor: aCategory
	"Answer the block color for the given category."

	'control' = aCategory ifTrue: [^ (Color h: 41 s: 0.85 v: 0.9)].
	'motion' = aCategory ifTrue: [^ (Color h: 225 s: 0.65 v: 0.83)].
	'motor' = aCategory ifTrue: [^ (Color h: 220 s: 0.85 v: 0.725)].
	'looks' = aCategory ifTrue: [^ (Color h: 264 s: 0.62 v: 0.89)].
	'pen' = aCategory ifTrue: [^ (Color h: 165 s: 1 v: 0.63)].
	'operators' = aCategory ifTrue: [^ (Color h: 93 s: 0.9 v: 0.76)].
	'sound' = aCategory ifTrue: [^ (Color h: 296 s: 0.66 v: 0.85)].
	'sensing' = aCategory ifTrue: [^ (Color h: 200 s: 0.98 v: 0.86)].
	'variables' = aCategory ifTrue: [^ (Color h: 25 s: 0.88 v: 0.95)].
	'list' = aCategory ifTrue: [^ ListBlockColor].

	^ (Color h: 0 s: 0.81 v: 0.83)  "a shade of red"
