fetching
fetchFailureReason
	"Answer the reason for the fetch failure. Answer the empty string if there has not been a failure." 

	fetcher ifNil: [^ ''].
	^ fetcher failureReason
