accessing
projectFetcher

	| fullPath |
	fullPath := currentDir path, self selectedFile, '.scratch'.

	scratchProjectFetcher ifNotNil: [  "try to use the existing fetcher"
		(scratchProjectFetcher serverName = currentDir serverName and:
		 [scratchProjectFetcher path = fullPath])
			ifTrue: [^ scratchProjectFetcher]
			ifFalse: [
				scratchProjectFetcher stopDownload.
				scratchProjectFetcher := nil]].

	"make a new fetcher"
	^ HTTPFetcher new
		startDownload: fullPath
		fromServer: currentDir serverName.

