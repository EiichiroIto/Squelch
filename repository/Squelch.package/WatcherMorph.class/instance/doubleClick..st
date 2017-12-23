event handling
doubleClick: evt
	"Toggle slider/large readout view if I'm in the work pane."

	(self owner isKindOf: ScratchStageMorph) ifFalse: [^ self].  "ignore if not on stage"

	scratchSlider ifNotNil: [^ self showLargeReadout]. "slider -> large readout"
	isLarge ifTrue: [^ self showSmallReadout].  "large readout -> small readout"
	self isVariableWatcher
		ifTrue: [self showSlider]  "small readout -> slider"
		ifFalse: [self showLargeReadout].  "small readout -> large readout"
