other
readThumbnailFile
	"Attempt to read the thumbnail file in my directory and store the result in dict. If the file doesn't exist or can't be read, make dict be an empty dictionary."

	| fName f buf |
	dict := Dictionary new.
	fName := (directory / ThumbnailFileName) pathString.
	[	(FileStream isAFileNamed: fName) ifTrue: [
			f := (FileStream readOnlyFileNamed: fName) binary.
			buf := f contentsOfEntireFile.
			dict := ObjStream new readObjFrom: (ReadStream on: buf)].
	] ifError: [].
