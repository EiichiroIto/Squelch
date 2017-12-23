I am a DialogBox for presenting messages to the user and asking them simple yes/no/okay/cancel questions. I have instance variables for all the forms that comprise my frame which I draw myself.

Examples:
	DialogBoxMorph ask: 'Time for lunch?'
	DialogBoxMorph askWithCancel: 'Save project before quitting?'
	DialogBoxMorph inform: 'Operation complete.'
	DialogBoxMorph informWithCancel: 'This operation may take a while...'
	DialogBoxMorph warn: 'File not found'

For string input, see StringDialogBoxMorph.
