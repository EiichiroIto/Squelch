sound ops
setVolumeTo: aNumber

	| stage player |
	volume := aNumber min: 100 max: 0.
	(stage := self meOrOwnerThatIsA: ScratchStageMorph) ifNotNil: [
		(player := stage notePlayerFor: self) ifNotNil: [
			player volume: volume]].

	media do: [:snd |
		snd isSound ifTrue: [snd volume: volume]].
