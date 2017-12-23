media
savePhoto: aForm

	| n f |
	n := self unusedMediaNameFromBaseName: 'background' localized, '1'.

	f := Form extent: self extent depth: 32.
	(WarpBlt toForm: f)
		sourceForm: aForm;
		cellSize: 1;  "installs a new colormap if cellSize > 1"
		combinationRule: Form over;
		copyQuad: aForm boundingBox innerCorners toRect: f boundingBox.

	self addMediaItem: (ImageMedia new mediaName: n; form: f).

