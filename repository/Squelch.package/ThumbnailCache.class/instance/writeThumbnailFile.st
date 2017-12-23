other
writeThumbnailFile
	"Write dict to the thumbnail file in my directory. Do nothing if the file cannot be written."

	| f |
	dict size = 0 ifTrue: [  "if no thumbnails and no thumbnails file to delete, do nothing"
		(FileStream isAFileNamed: (directory / ThumbnailFileName) pathString)
			ifFalse: [^ self]].

	[	(directory / ThumbnailFileName) delete.  "delete may fail if directory is read-only or is an alias"
		((dict size > 0) or: [directory fileExists: ThumbnailFileName]) ifTrue: [
			f := (FileStream fileNamed: (directory / ThumbnailFileName) pathString) binary.
			ObjStream new storeObj: dict on: f.
			f close].
	] ifError: [].
