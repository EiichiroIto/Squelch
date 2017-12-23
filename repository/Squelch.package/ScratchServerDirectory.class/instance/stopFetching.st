accessing
stopFetching
	"Stop the fetch that is in progress. Do nothing if a fetch is not in progress."

	fetcher ifNotNil: [
		fetcher stopDownload.
		fetcher := nil].

