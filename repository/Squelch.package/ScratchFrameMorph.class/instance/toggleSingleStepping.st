menu/button actions
toggleSingleStepping
	"Toggle single stepping."

	ScratchProcess blockHighlightMSecs <= 1
		ifTrue: [ScratchProcess blockHighlightMSecs: 60]
		ifFalse: [ScratchProcess blockHighlightMSecs: 1].
