button actions
shoutGo

	frame ifNotNil: [frame shoutGo].
	flagButton on.
	World displayWorldSafely.  "force button flash"
	(Delay forMilliseconds: 20) wait