utilities
waitForCompletionOrCancelOfFetch: anHTTPFetcher
	"Put up dialog box until the given fetch completes, fails, or is cancelled by the user."
	"self waitForCompletionOrCancelOfFetch: nil"

	| dialogBox total |
	dialogBox := DialogBoxMorph new
		title: 'Downloading...';
		withButtonsForYes: false no: false okay: false cancel: true;
		extent: 200@150;
		percentDone: 0.

	dialogBox center: World center.
	dialogBox openInWorld.

	total := nil.
	[dialogBox isDone not & anHTTPFetcher inProgress] whileTrue: [
		Delay waitMSecs: 100.
		total ifNil: [total := anHTTPFetcher contentLength].
		total ifNotNil: [
			dialogBox percentDone: (100 * anHTTPFetcher bytesDownloaded) // total].
		World doOneCycle].  "wait for user to press a button"

	anHTTPFetcher succeeded ifFalse: [
		dialogBox message: 'Failed: ', anHTTPFetcher failureReason.
		[dialogBox isDone not] whileTrue: [World doOneCycle]].

	dialogBox delete.
	World doOneCycle.
