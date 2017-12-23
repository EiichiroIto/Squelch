menu/button actions
addSpriteMorph

	| result f m el |
	self world activeHand toolType: nil.
	self paintingInProgress ifTrue: [^ self beep].

	result := ScratchFileChooserDialog chooseSpriteCostumeFor: self.
	result = #cancelled ifTrue: [^ self].
	(result asLowercase endsWith: '.sprite')
		ifTrue: [^ self importSpriteOrProject: result].

	[f := Form fromFileNamed: result] ifError: [^ self].
	el := ImageMedia new form: (ScratchFrameMorph scaledFormForPaintEditor: f).
	m := ScratchSpriteMorph new soleCostume: el.
	el mediaName: (m unusedMediaNameFromBaseName: (result asFileReference basename)).
	self addAndView: m.
