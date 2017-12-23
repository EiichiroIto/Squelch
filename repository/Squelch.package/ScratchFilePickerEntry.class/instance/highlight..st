accessing
highlight: aBoolean
	"Show or hide my highlight."

	aBoolean ifFalse: [
		highlit := false.
		self color: owner color.
		nameMorph font: (ScratchFrameMorph getFont: #FilePickerEntry); color: Color black.
		borderWidth := 0.
		^ self].

	highlit := true.

	"self color: owner color darker darker darker.
	borderWidth := 2.
	borderColor := (Color r: (96/255) g: (136/255) b: (182/255))."

	self color: (Color r: (96/255) g: (136/255) b: (182/255)).

	nameMorph font: (ScratchFrameMorph getFont: #FilePickerEntryHighlighted); color: Color white.
