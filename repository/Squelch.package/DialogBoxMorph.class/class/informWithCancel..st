instance creation
informWithCancel: informationString
	"Put up an instance of me to give the user an informational message and wait until they click the 'ok' button before proceeding."
	"DialogBoxMorph informWithCancel: 'This operation may take a while...'"

	| dialogBox |
	dialogBox := self new
		withButtonsForYes: false no: false okay: false cancel: true;
		message: informationString.
	^ dialogBox getUserResponse
