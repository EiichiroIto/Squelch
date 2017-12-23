instance creation
ask: questionString
	"Put up an instance of me to ask the user for the name for a new variable."

	| dialogBox |
	dialogBox := self new
		withButtonsForYes: false no: false okay: true cancel: true;
		message: questionString;
		extent: 330@200.
	^ dialogBox getUserResponse
