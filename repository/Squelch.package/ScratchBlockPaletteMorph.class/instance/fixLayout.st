other
fixLayout
	"Right align the blocks in the palette if RTL is set to true. The watcher toggle checkbox buttons are assumed to be about 18 pixels wide."

	| offset r |
	owner ifNil: [^ self].
	ScratchTranslator isRTL ifTrue:[
		self submorphs do: [:m |
			(m isKindOf: BlockMorph) ifTrue: [
				m canBecomeWatcher
					ifTrue: [m position: (self right - m width - 18 - 10)@(m position y)]
					ifFalse: [m position: (self right - m width - 10)@(m position y)].
				m changed].
			((m isKindOf: ToggleButton) or: [m isKindOf: ResizableToggleButton2]) ifTrue:[	"watcher checkbox case"
				m position: (self right - m width - 10)@(m position y)].
			(m isKindOf: ImageMorph) ifTrue: [
				m position: (self right - m width - 10)@(m position y)]]].
	offset := self topLeft negated.
	r := 0@0 extent: 1@1.
	self submorphsDo: [:m |
		r := r quickMerge: (m fullBounds translateBy: offset) truncated].
	self width: (r width max: owner width).
