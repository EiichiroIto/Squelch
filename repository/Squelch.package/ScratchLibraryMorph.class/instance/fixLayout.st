geometry
fixLayout
	"Position and size thumbnails."

	| libPane x y rMargin sFrame m2 |
	scrollPane isNil | stagePane isNil | spritePane isNil ifTrue: [^ self].

	spritePane width: self width.
	spritePane height: topSectionHeight.

	spriteLabel position: (self left + 15)@(self top + (topSectionHeight // 2) - (spriteLabel height // 2) + 3).
	sFrame := self meOrOwnerThatIsA: ScratchFrameMorph.
	(sFrame isNil or: [sFrame viewMode = #normal])
		ifTrue: [buttonPane position: (spriteLabel right + 10)@(self top + (topSectionHeight // 2) - (buttonPane height // 2) + 3)]
		ifFalse: [buttonPane position: (self left + 12)@(self top + (topSectionHeight // 2) - (buttonPane height // 2) + 3)].
	

	stagePane height = self height ifFalse: [
		stagePane height: self height].
	scrollPane height = self height ifFalse: [
		scrollPane height: self height - topSectionHeight].
	scrollPane width = (self right - stagePane right) ifFalse: [
		scrollPane width: self right - stagePane right].

	scrollPane position: scrollPane left @ (self top + topSectionHeight + 3).
	stagePane position: stagePane left @ (self top + topSectionHeight + 3).

	libPane := scrollPane contents.
	ScratchTranslator isRTL
		ifTrue: [x := libPane left + 30]
		ifFalse: [x := libPane left + 8].
	y := libPane top + 7.
	rMargin := x + scrollPane width - 5.
	libPane submorphs do: [:m |
		(x + m width) > rMargin ifTrue: [
			ScratchTranslator isRTL
				ifTrue: [x := libPane left + 30]
				ifFalse: [x := libPane left + 8].
			y := y + m height].
		m position: x@y.
		x := x + m width].

	stagePane submorphCount > 0 ifTrue: [
		m2 := stagePane firstSubmorph.
		m2 position: stagePane topLeft + ((stagePane extent - stagePane firstSubmorph extent) // 2) + (0@15) - (0@topSectionHeight)].
