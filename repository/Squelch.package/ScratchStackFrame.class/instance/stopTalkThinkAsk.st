accessing
stopTalkThinkAsk

	| s |
	(expression isKindOf: CommandBlockMorph) ifTrue: [
		((#say:duration:elapsed:from: = expression selector) |
		 (#think:duration:elapsed:from: = expression selector)) ifTrue: [
			expression receiver sayNothing].

		#doAsk = expression selector ifTrue: [
			(s := expression receiver meOrOwnerThatIsA: ScratchStageMorph) ifNotNil: [s stopAsks]]].
