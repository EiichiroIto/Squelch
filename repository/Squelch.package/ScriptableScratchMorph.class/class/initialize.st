class initialization
initialize
	"self initialize"

	Experimental := false.
	ScratchOrigin := 0@0.
	RandomGen := Random new.
	TimerStartMSecs := Time millisecondClockValue.
	ListBlockColor := Color h: 18 s: 0.92 v: 0.85.
