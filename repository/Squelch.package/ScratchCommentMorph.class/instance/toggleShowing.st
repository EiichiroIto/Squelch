private
toggleShowing

	| colors |
	isShowing := isShowing not.
	colors := showHideMorph form colors.
	isShowing
		ifTrue: [
			showHideMorph form: (ScratchFrameMorph skinAt: #arrowOpenComment).
			showHideMorph form colors: colors.
			(self submorphs at: 2) addMorphBack: commentMorph.
			(self submorphs at: 2) addMorphBack: resizeMorph.
			commentMorph startStepping.
			labelMorph contents: ''.
			self comeToFront.
			self color: self commentMorphColor]
		ifFalse: [
			showHideMorph form: (ScratchFrameMorph skinAt: #arrowClosedComment).
			showHideMorph form colors: colors.
			commentMorph delete.
			resizeMorph delete.
			labelMorph contents: self labelWhenClosed.
			self color: self topBarColor].

	anchor ifNotNil: [anchor topBlock commentLayoutChanged].

