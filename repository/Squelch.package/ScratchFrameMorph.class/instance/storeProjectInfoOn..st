file read/write
storeProjectInfoOn: aBinaryStream

	| s |
	projectInfo at: 'thumbnail' put: workPane thumbnailForm.

	s := WriteStream on: (ByteArray new: 100000).
	ObjStream new storeObj: projectInfo on: s.

	aBinaryStream uint32: s size.
	aBinaryStream nextPutAll: s contents.
