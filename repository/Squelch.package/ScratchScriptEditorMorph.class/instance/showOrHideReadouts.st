private
showOrHideReadouts
	"If this is a sprite, show the position and direction readouts and the rotation style buttons. Otherwise, hide them."

	self deleteRotationButtons; deleteLockButton; deleteReadouts.

	nameMorph
		font: nameMorph font;
		width: nameMorph height * 4;
		rightJustify: ScratchTranslator isRTL.

	(self target isKindOf: ScratchSpriteMorph) ifTrue: [
		self addRotationButtons; addLockButton; addReadouts.
		World ifNotNil: [World startSteppingSubmorphsOf: self]].
