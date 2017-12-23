accessing
parentDirectory
	"Answer a new ServerDirectory on the parent of my current path."

	| newPath parts |
	fetcher ifNotNil: [fetcher stopDownload. fetcher := nil].

	newPath := ''.
	parts := path findTokens: '/'.
	1 to: parts size - 1 do: [:i |
		newPath := newPath, '/', (parts at: i)].
	((newPath size = 0) or: [newPath last ~= $/]) ifTrue: [newPath := newPath, '/'].

	^ self copy path: newPath
