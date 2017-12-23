menu/button actions
pressGreenFlagButton
	"Simulate pressing the green flag button when enter key is pressed."

	flagButton on.
	World displayWorld.
	(Delay forMilliseconds: 100) wait.
	flagButton off.
	World displayWorld.
	self shoutGo.

