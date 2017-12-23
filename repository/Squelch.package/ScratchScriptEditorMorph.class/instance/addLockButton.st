private
addLockButton
	"Add button to set sprite locked status."

	self deleteLockButton.

	lockButton := ToggleButton
		onForm: (ScratchFrameMorph skinAt: #locked)
		offForm: (ScratchFrameMorph skinAt: #unlocked).

	lockButton
		target: self;
		actionSelector: #toggleSpriteDraggable;
		setBalloonText: 'draggable on website?' localized;
		actWhen: #buttonUp;
		isMomentary: true;
		position: (nameMorph right + 4)@(nameMorph top + ((nameMorph height - lockButton height) / 2)).

	self addMorph: lockButton.
	self updateLockButton.
