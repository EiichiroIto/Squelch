entry points
startOn: anArrayOfCommands sprite: aSprite

	sprite := aSprite.
	cmds := anArrayOfCommands.
	ip := 1.
	stack := OrderedCollection new.
	yield := false.
	done := false.
	startTime := nil.		"used by timed commands like glide"
	tmp := nil.			"used by timed commands and repeat"
