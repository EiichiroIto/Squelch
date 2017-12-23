instance creation
ask: questionString initialAnswer: aString
	"Put up an instance of me to ask the user for string input (such as file name). The initial response text is set to the given string, which the user can replace or edit. Answer the edited string."

	| dialogBox |
	dialogBox := self new
		withButtonsForYes: false no: false okay: true cancel: false;
		message: questionString;
		initialAnswer: aString.
	^ dialogBox getUserResponse
