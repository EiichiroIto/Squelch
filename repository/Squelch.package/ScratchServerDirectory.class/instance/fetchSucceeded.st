fetching
fetchSucceeded
	"Answer true if fetching my contents was successful." 

	fetcher ifNil: [^ false].
	^ fetcher succeeded
