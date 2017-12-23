instance creation
warn: informationString
	"Put up an instance of me to give the user a warning message and wait until they click the 'ok' button before proceeding."
	"DialogBoxMorph warn: 'File not found'"

	| dialogBox |
	dialogBox := self new
		title: '!';
		withButtonsForYes: false no: false okay: true cancel: false;
		message: informationString.
	^ dialogBox getUserResponse
