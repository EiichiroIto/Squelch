accessing
extensions: anArrayOfStringsOrNil
	"Set the set of extensions used to select which files to display. For example, extensions might be set to #(gif bmp png jpg) to show only files containing images. No filtering is done if extensions is nil, as it is by default."

	extensions := anArrayOfStringsOrNil.
	extensions ifNotNil: [
		extensions := extensions asArray collect: [:s | s asString asLowercase]].
