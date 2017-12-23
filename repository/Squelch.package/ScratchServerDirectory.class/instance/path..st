accessing
path: aString
	"Set my path to the given string."

	fetcher ifNotNil: [fetcher stopDownload. fetcher := nil].
	path := aString.
