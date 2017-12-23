initialization
buildSubmorphs

	| thumbHeight |
	self buildRightSideMorph.

	numberMorph := (StringMorph contents: '345')
		font: (ScratchFrameMorph getFont: #MediaItemInfo);
		color: Color white;
		position: topRightInset.
	self addMorph: numberMorph.
	numberMorphTopRight := numberMorph topRight.

	thumbHeight := minThumbHeight max: (rightMorph height - (2 * highlightPadding y)).
	thumbnailMorph := TranslucentImageMorph new.
	thumbnailMorph form: (media thumbnailFormExtent: thumbHeight asPoint).
	thumbnailMorph width > thumbHeight ifTrue: [
		highlightPadding := (highlightPadding x - ((thumbnailMorph width - thumbHeight)/2))@highlightPadding y].
	self addMorph: thumbnailMorph.
	thumbnailMorph position: numberMorph topRight + highlightPadding.

	highlightMorph := ImageFrameMorph new
		initFromForm: (ScratchFrameMorph skinAt: #costumeSelected).
	highlightMorph extent: thumbnailMorph extent + (highlightPadding * 2).

	self addMorph: rightMorph.
	rightMorph position: thumbnailMorph topRight + ((highlightPadding x + 10)@highlightPadding y negated).
	rightMorph extent: rightMorph extent x@(rightMorph extent y max: highlightMorph extent y).

	separator := TiledImageMorph new tileForm: (ScratchFrameMorph skinAt: #costumeSeparatorTile).
	self addMorph: separator.
	separator
		position: (numberMorph left)@(rightMorph bottom + 5);
		width: rightMorph right - 14.
	
	self extent: (rightMorph right + 10)@separator bottom
