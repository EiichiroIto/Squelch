menu/button actions
compressImages

	| s q count |
	s := StringDialog askWithCancel: 'JPEG Quality (10-100)?' initialAnswer: '70'.
	s size = 0 ifTrue: [^ self].
	q := [s asNumber] ifError: [nil].
	q ifNil: [^ self].
	q := (q min: 101 max: 10) truncated.

	q > 100 ifTrue: [q := nil].  "just canonicalize, don't compress"
	count := self canonicalizeImagesQuality: q saveOriginal: false.

	scriptsPane categoryChanged: 'Costumes'.
	DialogBoxMorph inform: 'Images compressed' withDetails: count printString.
