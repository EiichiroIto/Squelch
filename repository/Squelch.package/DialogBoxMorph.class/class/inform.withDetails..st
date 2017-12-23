instance creation
inform: informationString withDetails: detailsString
	"Put up an instance of me to give the user an informational message and wait until they click the 'ok' button before proceeding."
	"DialogBoxMorph inform: 'Operation complete.'"

	| dialogBox |
	dialogBox := self new
		withButtonsForYes: false no: false okay: true cancel: false.
	dialogBox
		message: (informationString localized, ScratchTranslator colonSuffix)
		details: detailsString
		font: (ScratchFrameMorph getFont: #DialogBoxMessage).

	^ dialogBox getUserResponse
