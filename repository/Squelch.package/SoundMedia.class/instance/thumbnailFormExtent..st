scratch ops
thumbnailFormExtent: extent
	"Answer a Form of the given extent containing a thumbnail of me containing the sound icon."

	| offForm onForm f icon |
	offForm := ScratchFrameMorph skinAt: #scratchSound.
	onForm := ScratchFrameMorph skinAt: #scratchSoundOn.
	f := (Form extent: extent depth: 8).
	playingSound
		ifNil: [icon := offForm]
		ifNotNil: [icon := self isPlaying ifTrue: [onForm] ifFalse: [offForm]].
	icon displayOn: f at: (f extent - icon extent) // 2 rule: Form paint.
	^ f
