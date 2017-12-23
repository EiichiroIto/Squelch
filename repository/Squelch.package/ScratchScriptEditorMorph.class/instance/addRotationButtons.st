private
addRotationButtons
	"Add buttons to set the rotation style."

	| specs x y style button |
	self deleteRotationButtons.
	(self target respondsTo: #rotationStyle:) ifFalse: [^ self].

	specs := #(
		(Smooth		'can rotate')
		(Flip		'only face left-right')
		(None		'don''t rotate')).

	x := self left + 13.
	y := self top + 18.
	specs do: [:pair |
		style := pair first.
		button := ToggleButton
			onForm: (ScratchFrameMorph skinAt: ('rotStyle', style, 'On'))
			offForm: (ScratchFrameMorph skinAt: ('rotStyle', style))
			overForm: (ScratchFrameMorph skinAt: ('rotStyle', style, 'Over')).
		button
			target: self;
			arguments: (Array with: style);
			actionSelector: #setRotationStyle:;
			setBalloonText: pair second localized;
			actWhen: #buttonDown;
			position: x@y.
		self addMorph: button.
		rotationButtons := rotationButtons copyWith: button.
		y := y + button height + 2].

	self updateRotationButtonHighlight.
