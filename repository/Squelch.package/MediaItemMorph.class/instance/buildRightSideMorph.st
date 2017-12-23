initialization
buildRightSideMorph
	"Answers the part of MediaItemMorph that includes the label, the edit/copy or record/play buttons, etc. This includes everything but the sprite image, the number, and the horizontal divider."

	| e c bottom |
	rightMorph := Morph new.
	rightMorph color: (Color transparent).

	nameMorph := UpdatingStringFieldMorph new
		acceptWhenFocusLost: true;
		font: (ScratchFrameMorph getFont: #UpdatingStringField);
		rightJustify: ScratchTranslator isRTL;
		getSelector: #mediaName;
		putSelector: #mediaName:;
		position: (0@0);
		target: self.

	nameMorph width: (5 * nameMorph height) asInteger.
	rightMorph addMorphBack: nameMorph.

	infoMorph := (StringMorph contents: (media infoString))
		font: (ScratchFrameMorph getFont: #MediaItemInfo);
		position: nameMorph left + 2 @ (nameMorph bottom).
	rightMorph addMorph: infoMorph.

	media isSound
		ifTrue: [
			self addPlayButton.
			playButton position: (nameMorph left)@(infoMorph bottom + 5).
			self addStopButton.
			stopButton position: playButton topRight + (5@0).
			deleteButton := self getDeleteButton.
			rightMorph addMorph: deleteButton.
			deleteButton left: stopButton right + 5.
			bottom := stopButton bottom.
		] ifFalse: [
			e := self getEditButton.
			rightMorph addMorph: e.
			e position: nameMorph left@(infoMorph bottom + 5).
			c := self getCopyButton.
			rightMorph addMorph: c.
			c position: e topRight + (5@0).
			deleteButton := self getDeleteButton.
			rightMorph addMorph: deleteButton.
			deleteButton left: c right + 5.
			bottom := c bottom].

	nameMorph extent: (deleteButton right max: nameMorph width)@(nameMorph extent y).
	deleteButton position: (nameMorph right - deleteButton width)@(infoMorph bottom + 6).

	soundSizeMorph := (StringMorph contents: '')
		font: (ScratchFrameMorph getFont: #MediaItemInfo);
		position: nameMorph right @ nameMorph bottom.
	rightMorph addMorph: soundSizeMorph.

	soundSizeMorph
		contents: media mediaSizeInKilobytes asString , ' KB';
		position: ((nameMorph right - soundSizeMorph width) @ nameMorph bottom).

	rightMorph extent: nameMorph width@bottom.
