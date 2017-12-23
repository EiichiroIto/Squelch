private
movieFileIsOpen
	"Answer true if I have an open movie file. If movie is not nil but is not currently open, try to reopen it."

	movieFile ifNil: [^ false].
	movieFile fileHandle ifNil: [
		"try to reopen the file:"
		movieFile := nil.
		self basicLoadFile: fileName].

	^ movieFile notNil
