testing
serializeAndDeserialize: anObject
	"For testing. Serialize and de-serialize the given object and answer the result."

	| stream |
	stream := WriteStream on: ByteArray new.
	ObjStream new storeObj: anObject on: stream showProgress: false.
	^ ObjStream new readObjFrom: (ReadStream on: stream contents)
