stepping
stepSubmorphs
	"Run my submorph 'step' methods if their time has come."

	| now lastTime |
	now := Time millisecondClockValue.
	stage submorphsDo: [:topM |
		topM allMorphsDo: [:m |
			lastTime := lastStepTime at: m ifAbsent: [-1000000].
			((now - lastTime) > m stepTime) ifTrue: [
				m step.
				lastStepTime at: m put: now]]].
