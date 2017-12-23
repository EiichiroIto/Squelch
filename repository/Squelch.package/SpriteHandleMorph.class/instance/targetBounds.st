private
targetBounds
	"private - answer the target's bounds as it displayed on screen, i.e. in q-size mode"

	| stage ratio home center |

	ratio := 1.
	stage := target meOrOwnerThatIsA: ScratchStageMorph.
	stage notNil & stage isQuarterSize ifTrue: [ratio := 0.5 ].
	home := 0 @ 0.
	stage ifNotNil: [home := stage position ].

	center := target center - home * ratio + home.
	^Rectangle center: center extent: target extent * ratio