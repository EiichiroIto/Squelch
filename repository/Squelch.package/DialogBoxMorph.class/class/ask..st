instance creation
ask: questionString
	"Put up an instance of me to ask a yes/no question. Answer true or false depending on which button the user presses."
	"DialogBoxMorph ask: 'Time for lunch?'"

	| dialogBox |
	dialogBox := self new
		title: '?';
		withButtonsForYes: true no: true okay: false cancel: false;
		message: questionString.
	^ dialogBox getUserResponse
