file read/write
extractInfoFrom: aByteArray
	"Answer a Scratch info dictionary from the given ByteArray. Answer an empty dictionary if it is an old project."

	| s version |
	s := ReadStream on: aByteArray.
	version := ObjStream scratchFileVersionFrom: (s next: 10) asString.
	(version = 1) | (version = 2)
		ifTrue: [
			s skip: 4.  "skip info header byte count"
			^ ObjStream new readObjFrom: s showProgress: false]
		ifFalse: [^ Dictionary new].

