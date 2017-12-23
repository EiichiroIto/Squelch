initialization
initialize

	| button |
	super initialize.
	self color: Color black.
	doubleSize := false.
	lastStepTime := IdentityDictionary new.
	dummyMorph := Morph new.
	World addMorphFront: dummyMorph.

	buttons := #(
		(presentationExit	exitPresentation		'Exit presentation')
		(go					shoutGo				'Start green flag scripts')
		(stop				stopAll				'Stop everything')
	) collect: [:spec |
		button := ToggleButton
			onForm: (ScratchFrameMorph skinAt: (spec first, 'ButtonBlackPressed'))
			offForm: (ScratchFrameMorph skinAt: (spec first, 'ButtonBlack'))
			overForm: (ScratchFrameMorph skinAt: (spec first, 'ButtonBlackPressed')).
		button
			target: self;
			actionSelector: spec second;
			isMomentary: true;
			actWhen: #buttonUp;
			setProperty: #balloonText toValue: spec third localized;
			"drawToolTipAbove: true;"
			off.
		#shoutGo = spec second ifTrue: [flagButton := button].
		button].

	buttons do: [:b | self addMorph: b].
