private
addDeleteButton
	"Add button to delete sprite."

	self deleteDeleteButton.

	deleteButton := ToggleButton
		onForm: (ScratchFrameMorph skinAt: #deleteSprite)
		offForm: (ScratchFrameMorph skinAt: #deleteSprite)
		overForm: (ScratchFrameMorph skinAt: #deleteSprite).

	deleteButton
		target: self;
		actionSelector: #deleteSprite;
		setBalloonText: 'Delete this sprite' localized;
		actWhen: #buttonUp;
		isMomentary: true;
		position: (lockButton right + 27)@(nameMorph top + ((nameMorph height - deleteButton height) / 2)).

	self addMorph: deleteButton.
