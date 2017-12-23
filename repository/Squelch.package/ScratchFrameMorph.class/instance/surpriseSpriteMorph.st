menu/button actions
surpriseSpriteMorph

	| fileName f el m e |
	self world activeHand toolType: nil.
	self paintingInProgress ifTrue: [^ self beep].

	fileName := self nextSurpriseCostumeName.
	fileName ifNil: [
		^ self addAndView: ScratchFrameMorph defaultSprite fullCopy].

	[f := Form fromFileNamed: fileName] ifError: [^ self].
	el := ImageMedia new form: (ScratchFrameMorph scaledFormForPaintEditor: f).
	m := ScratchSpriteMorph new soleCostume: el.
	el mediaName: (m unusedMediaNameFromBaseName: fileName asFileReference basename).
	self addAndView: m.

	e := (workPane extent - m extent) abs // 2.
	m referencePosition: ((e x negated) to: e x) atRandom @ ((e y negated) to: e y) atRandom.
