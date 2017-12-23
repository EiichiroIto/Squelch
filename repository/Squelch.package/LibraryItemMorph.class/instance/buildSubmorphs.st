initialization
buildSubmorphs
	"LibraryItemMorph open"

	thumbnailMorph := ImageMorph new
		form: (Form extent: thumbWidth@thumbWidth depth: 32) fillWhite;
		position: ((self width - thumbWidth) // 2) @ 0.
	self addMorph: thumbnailMorph.

	nameMorph := StringMorph new
		font: (ScratchFrameMorph getFont: #LibraryItemName);
		position: 0 @ (thumbnailMorph bottom -2).
	self addMorph: nameMorph.

	"scriptCountMorph := StringMorph new
		font: (ScratchFrameMorph getFont: #LibraryItemInfo);
		contents: '';
		position: 0 @ nameMorph bottom.
	self addMorph: scriptCountMorph."

	self color: Color transparent.
