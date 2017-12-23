right button menu
rightButtonMenu

	| menu hasSlider |
	(self meOrOwnerThatIsA: ScratchStageMorph) ifNil: [^ self].

	menu := MenuMorph new.
	menu target: self.
	hasSlider := self isVariableWatcher and: [scratchSlider notNil].

	hasSlider not & isLarge not
		ifTrue: [menu add: '* ', 'normal readout' localized,' *'	selector: #showSmallReadout]
		ifFalse: [menu add: '  ', 'normal readout' localized		selector: #showSmallReadout].

	hasSlider not & isLarge
		ifTrue: [menu add: '* ', 'large readout' localized, ' *'		selector: #showLargeReadout]
		ifFalse: [menu add: '  ', 'large readout' localized			selector: #showLargeReadout].

	self isVariableWatcher ifTrue: [
		scratchSlider
			ifNil: [menu add: '  ', 'slider' localized selector: #showSlider]
			ifNotNil: [
				menu add: '* ', 'slider' localized,' *' selector: #showSlider.
				menu addLine.
				menu add: '  ', 'set slider min and max' localized selector: #setSliderMinAndMax]].

	menu addLine.
	menu add: '  ',  'hide' localized selector: #delete.
	menu localize.
	menu invokeAt: ActiveHand position in: self world