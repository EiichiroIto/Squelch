accessing
directoryNamed: aString
	"Answer a new ServerDirectory on the given subdirectory of my current path. In HTML terms, a subdirectory is a link from the current page."

	| newPath |
	fetcher ifNotNil: [fetcher stopDownload. fetcher := nil].

	newPath := aString.
	(newPath endsWith: '/') ifFalse: [newPath := newPath, '/'].

	newPath first = $/ ifTrue: [^ self copy path: newPath].  "absolute path"

	"relative path"
	newPath := path last = $/ ifTrue: [path, aString] ifFalse: [path, '/', aString].
	(newPath endsWith: '/') ifFalse: [newPath := newPath, '/'].

	^ self copy path: newPath
