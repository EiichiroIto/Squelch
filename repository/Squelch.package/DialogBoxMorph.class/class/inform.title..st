instance creation
inform: informationString title: titleString
	"Put up an instance of me to give the user an informational message and wait until they click the 'ok' button before proceeding."
	"DialogBoxMorph inform: 'Operation complete.' title: 'Status'"

	| dialogBox |
	dialogBox := self new
		withButtonsForYes: false no: false okay: true cancel: false;
		title: titleString.
	dialogBox
		message: informationString
		font: (StrikeFont fontName: 'VerdanaBold' size: 13).

	^ dialogBox getUserResponse
