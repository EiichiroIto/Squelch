private
reportScratchProjectInfo
	"Try to retrieve info for the currently selected Scratch project and, if successful, report it to our client."

	| fullPath |
	scratchInfoClient ifNil: [^ self].

	scratchProjectFetcher ifNotNil: [
		scratchProjectFetcher stopDownload.
		scratchProjectFetcher := nil].

	self selectedFile ifNil: [scratchInfoClient scratchInfo: nil. ^ self].

	(currentDir isKindOf: FileReference) ifTrue: [
		^ scratchInfoClient scratchInfo: self getScratchInfoFromFile].

	"directory is on a server: start a fetcher to get the project info"
	fullPath := currentDir path, self selectedFile, '.scratch'.
	scratchProjectFetcher ifNil: [scratchProjectFetcher := ZnClient new].

	((scratchProjectFetcher serverName ~= currentDir serverName) |
	 (scratchProjectFetcher path ~= fullPath)) ifTrue: [
		"start fetching from the new path"
		scratchProjectFetcher
			startDownload: fullPath 
			fromServer: currentDir serverName].

	Delay waitMSecs: 50.
	self checkForScratchInfoFetchDone.
