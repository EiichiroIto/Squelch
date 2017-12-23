event handling
toggleShowing

	| colors |
	isShowing := isShowing not.
	colors := showHideMorph form colors.
	isShowing
		ifTrue: [
			showHideMorph form: (ScratchFrameMorph skinAt: #arrowOpenComment).
			showHideMorph form colors: colors.
			self addMorph: commentMorph.
			commentMorph startStepping]
		ifFalse: [
			showHideMorph form: (ScratchFrameMorph skinAt: #arrowClosedComment).
			showHideMorph form colors: colors.
			commentMorph delete].
