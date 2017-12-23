testing
scratchObjectsFrom: aFileName
	"Read a Scratch project from the file with the given name and answer the objects array."

	| f version objects |
	f := (FileStream readOnlyFileNamed: aFileName) binary.
	version := self scratchFileVersionFrom: (f next: 10) asString.
	version = 0 ifTrue: [
		f position: 0.
		objects := ObjStream new readObjFrom: f].
	(version = 1) | (version = 2) ifTrue: [
		f skip: f uint32.  "skip header"
		objects := ObjStream new readObjsFrom: f].
	f close.
	^ objects
