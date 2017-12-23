object i/o
storeFieldsOn: anObjStream

	| oldSnd |
	super storeFieldsOn: anObjStream.

	oldSnd := originalSound.
	compressedData ifNotNil: [originalSound := PlaceholderSound].  "for backward compatability"

	self storeFieldsNamed: #(
		originalSound
		volume
		balance
		compressedSampleRate
		compressedBitsPerSample
		compressedData
	) on: anObjStream.

	originalSound := oldSnd.
