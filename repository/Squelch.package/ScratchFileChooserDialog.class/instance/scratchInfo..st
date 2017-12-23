other
scratchInfo: infoDict
	"Update the Scratch project thumbnail and info display."

	| s |
	infoDict ifNil: [  "clear thumbnail and info"
		thumbnailMorph form: (Form extent: thumbnailMorph extent depth: 1) fillWhite.
		authorMorph contents: ''.
		commentMorph contents: ''.
		^ self].

	((infoDict includesKey: 'thumbnail') and: [thumbnailMorph notNil])
		ifTrue: [thumbnailMorph form: (infoDict at: 'thumbnail')]
		ifFalse: [thumbnailMorph form: (Form extent: thumbnailMorph extent depth: 1) fillBlack].

	authorMorph contents: ''.
	((infoDict includesKey: 'author') and: [authorMorph notNil]) ifTrue: [
		authorMorph contents: (infoDict at: 'author')].

	s := ''.
	readingScratchFile
		ifTrue: [
			(infoDict includesKey: 'comment') ifTrue: [s := infoDict at: 'comment']]
		ifFalse: [
			s := scratchFrame projectCommentOrTemplate].
	commentMorph contents: s; changed.

