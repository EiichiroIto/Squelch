media
savePhoto: aForm

	| n |
	n := self unusedMediaNameFromBaseName: 'costume' localized, '1'.
	self addMediaItem: (ImageMedia new mediaName: n; form: aForm).

