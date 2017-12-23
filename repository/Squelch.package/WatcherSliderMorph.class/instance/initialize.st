initialization
initialize

	"setup forms before calling super initialize"
	forms := Array new: 4.
	forms at: 1 put: (ScratchFrameMorph skinAt: #watcherSliderLeft).
	forms at: 2 put: (ScratchFrameMorph skinAt: #watcherSliderMiddle).
	forms at: 3 put: (ScratchFrameMorph skinAt: #watcherSliderRight).
	forms at: 4 put: (ScratchFrameMorph skinAt: #watcherSliderButton).

	super initialize.
	self minVal: 0;
		maxVal: 100;
		setValue: 50;
		borderWidth: 0.
