class initialization
initialize
	"self initialize"

	SystemCommands := IdentitySet new.
	SystemCommands addAll: #(
		doForever doForeverIf doIf doRepeat doReturn
		doBroadcastAndWait doPlaySoundAndWait doWaitUntil).
