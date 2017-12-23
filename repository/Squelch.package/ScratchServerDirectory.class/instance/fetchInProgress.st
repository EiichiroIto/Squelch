fetching
fetchInProgress
	"Answer true if my contents is still being fetched. If a fetch has not yet been started, start one."
	"Note: When this method answer's true, the client should first make sure that the fetch succeeded using fetchSucceeded. If it did, then directoryNames and projectNames can be called to access the directory contents."

	fetcher ifNil: [
		fetcher := HTTPFetcher new.
		fetcher startDownload: path fromServer: serverName].

	^ fetcher inProgress
