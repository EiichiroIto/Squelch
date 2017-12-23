instance creation
askWithCancel: questionString
	"Put up an instance of me to ask a yes/no question but include a cancel button as well. Answer either a boolean or the symbol #cancelled."
	"DialogBoxMorph askWithCancel: 'Save project before quitting?'"

	| dialogBox |
	dialogBox := self new
		title: '?';
		withButtonsForYes: true no: true okay: false cancel: true;
		message: questionString.
	^ dialogBox getUserResponse
