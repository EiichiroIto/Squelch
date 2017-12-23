instance creation
ask: questionString
	"Put up an instance of me to ask the user for string input (such as file name). Answer the edited string."

	^ self askWithCancel: questionString initialAnswer: ''
