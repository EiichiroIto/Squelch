looks ops
costumeIndex
	"Answer the index of my current costume."

	^ (media reject: [:m | m isSound])
		indexOf: costume ifAbsent: [1]
