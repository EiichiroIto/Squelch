menu/button actions
setSingleStepping
	"Ask whether script should be single-stepped."

	| menu mSecs |
	menu := MenuMorph new addTitle: 'Single-step speed?'.
	menu target: [ :v | mSecs := v ].
	menu add: 'Turbo speed' selector: #value: argument: 0.
	menu add: 'Normal' selector: #value: argument: 1.
	menu add: 'Flash blocks (fast)' selector: #value: argument: 30.
	menu add: 'Flash blocks (slow)' selector: #value: argument: 200.
	menu localize.
	menu invokeAt: ActiveHand position in: self world.
	mSecs ifNil: [ ^ self ].
	ScratchProcess blockHighlightMSecs: mSecs