instance creation
inform: informationString
	"Put up an instance of me to give the user an informational message and wait until they click the 'ok' button before proceeding."
	"DialogBoxMorph inform: 'Operation complete.'"

	| dialogBox |
	dialogBox := self new
		withButtonsForYes: false no: false okay: true cancel: false.
	dialogBox
		message: informationString
		font: (ScratchFrameMorph getFont: #DialogBoxMessage).

	^ dialogBox getUserResponse
