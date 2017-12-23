private
serialized
	"Answer a ByteArray containing this Scratch object in serialized form."

	| s objToExport |
	s := WriteStream on: (ByteArray new: 100000).
	objToExport := self copyForExport.
	ObjStream new storeObj: objToExport on: s showProgress: false.
	^ s contents
