stepping
topArgMorphAt: aRectangle exclude: aMorph
	"Give feedback about possible drop targets."

	| stack argM |
	"find the top block or stack under the given point, excluding the given morph"
	stack := submorphs
		detect: [:m | (m ~~ aMorph) and: [(m isKindOf: BlockMorph) and: [m fullBounds intersects: aRectangle]]]
		ifNone: [^ nil].

	stack allMorphsDo: [:b |
		((b isKindOf: CommandBlockMorph) and:
		 [(b isKindOf: HatBlockMorph) not]) ifTrue: [
			1 to: b argumentCount do: [:i |
				argM := b argumentAt: i.
				((argM bounds intersects: aRectangle) and:
				 [argM acceptsDroppedReporters])
					ifTrue: [^ argM]]].
		(b isKindOf: WhenHatBlockMorph) ifTrue: [
			argM := b argMorph.
			((argM bounds intersects: aRectangle) and:
			 [argM acceptsDroppedReporters])
				ifTrue: [^ argM]]].
	^ nil
