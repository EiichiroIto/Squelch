accessing
target: aSprite
	"show me"

	| stage tb x |
	target := aSprite.
	stage := target meOrOwnerThatIsA: ScratchStageMorph.
	tb := self targetBounds.

	"make sure the target sprite is onstage"
	stage notNil & stage fullContainsPoint: target center.
	(stage notNil and: [stage bounds containsPoint: target center]) ifFalse: [
		target referencePosition: 0@0.
		tb := self targetBounds].
	self	openInWorld.

	#resize = type
		ifTrue: [
			target xpos > 0
				ifTrue: [
					reversed := true.
					x := tb left]
				ifFalse: [x := tb right].
			^self center: x @ tb center y].

	(target xpos > 0 & (target heading > 0))
		ifTrue: [
			reversed := true.
			self position: (tb center + (Point r: (tb width/2) degrees: target rotationDegrees + 180))]
		ifFalse: [self center: (tb center + (Point r: (tb width/2) degrees: target rotationDegrees))].
