other
printHatNameOn: aStream
	"Append a human-readable string for this hat block's name to the given stream."

	aStream nextPutAll: 'when ', scriptNameMorph choice, ' key pressed'; cr.
