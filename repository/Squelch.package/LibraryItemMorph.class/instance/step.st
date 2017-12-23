stepping
step
	"Optimization: Don't update unless the costume has changed."

	| changeTime stage frame |
	target ifNil: [
		(frame := (self meOrOwnerThatIsA: ScratchFrameMorph)) ifNotNil: [
			(stage := frame workPane) ifNotNil: [
				stage updateSpritesList]].
		^ self].
	target world isNil ifTrue: [target := nil. ^ self].
	changeTime := target costumeChangeMSecs.
	changeTime = lastUpdateMSecs ifFalse: [
		self updateThumbnail.
		lastUpdateMSecs := changeTime].
	Sensor peekAnyButtonPressed ifFalse: [self updateNameAndInfo].
