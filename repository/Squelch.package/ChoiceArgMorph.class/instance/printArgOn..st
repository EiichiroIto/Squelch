other
printArgOn: aStream
	"Print this argument morph on the given stream."

	aStream nextPutAll: '"', self labelMorph contents, '"'.
