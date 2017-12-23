blocks
viewerPageForMotion
	"Answer a morph containing mtion blocks for the given category for use in the given ScratchViewer."

	| bin isStage addMotorBlocks s font x y m |
	bin := ScratchBlockPaletteMorph new.

	(self isKindOf: ScratchStageMorph)
		ifTrue: [
			isStage := true.
			addMotorBlocks := self showMotorBlocks]
		ifFalse: [
			isStage := false.
			s := self meOrOwnerThatIsA: ScratchStageMorph.
			addMotorBlocks := s notNil and: [s showMotorBlocks]].

	(isStage & addMotorBlocks not) ifTrue: [
		font := (ScratchFrameMorph getFont: #ViewerPage).
		x := 20.
		y := 12.
		m := StringMorph contents: 'Stage selected:' localized font: font.
		bin addMorph: (m color: Color white; position: x@y).
		m := StringMorph contents: 'No motion blocks' localized font: font.
		bin addMorph: (m color: Color white; position: x@(y + 17)).
		^ bin].

	x := 12.
	y := 10.
	(self blocksFor: 'motion') do: [:blockOrSym |
		(blockOrSym = #-) | (blockOrSym = #~)
			ifTrue: [
				(blockOrSym = #-) ifTrue: [y := y + 15].  "insert a full space"
				(blockOrSym = #~) ifTrue: [y := y + 5]]  "insert a half space"
			ifFalse: [
				y := self createBlock: blockOrSym atPosition: x@y onPage: bin]].

	addMotorBlocks ifFalse: [^ bin].

	isStage ifFalse: [
		y := y + 7.
		bin addMorph: ((ImageMorph new form: (ScratchFrameMorph skinAt: #connector)) position: x@y).
		y := y + 20].

	(self blocksFor: 'motor') do: [:blockOrSym |
		(blockOrSym = #-) | (blockOrSym = #~)
			ifTrue: [
				(blockOrSym = #-) ifTrue: [y := y + 15].  "insert a full space"
				(blockOrSym = #~) ifTrue: [y := y + 5]]  "insert a half space"
			ifFalse: [
				y := self createBlock: blockOrSym atPosition: x@y onPage: bin]].

	^ bin
