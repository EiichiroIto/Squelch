accessing
highlight: aBoolean
	"Show or hide my highlight."

	aBoolean ifFalse: [
		self color: owner color.
		nameMorph font: (ScratchFrameMorph getFont: #FilePickerEntry); color: Color black.
		highlit := false.
		borderWidth := 0.
		nameMorph left: self left + ((self width - nameMorph width) // 2).
		^ self].

	"self color: owner color darker darker darker.
	borderWidth := 2.
	borderColor := (Color r: (96/255) g: (136/255) b: (182/255))."

	self color: (Color r: (96/255) g: (136/255) b: (182/255)).

	nameMorph font: (ScratchFrameMorph getFont: #FilePickerEntryHighlighted); color: Color white.
	nameMorph left: self left + ((self width - nameMorph width) // 2).

	highlit := true.
