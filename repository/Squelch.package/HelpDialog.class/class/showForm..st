instance creation
showForm: aForm
	"HelpDialogMorph showForm: (Form fromFileNamed: 'move.gif')"

	| dialog |
	dialog := super new
		withButtonsForYes: false no: false okay: true cancel: false;
		title: 'help';
		helpForm: aForm;
		extent: (aForm extent + (80@145)).
	^ dialog getUserResponse
