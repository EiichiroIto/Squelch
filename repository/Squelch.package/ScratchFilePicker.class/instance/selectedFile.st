accessing
selectedFile
	"Answer the local name of the currently selected file or nil if there is no file selected."

	contentsPaneMorph contents submorphsDo: [:m |
		(m isHighlit & m entryIsDirectory not) ifTrue: [^ m entryName]].
	^ nil
