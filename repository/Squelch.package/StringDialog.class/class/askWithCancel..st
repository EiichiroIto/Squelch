instance creation
askWithCancel: questionString
	"Like ask:, but with a cancel button. Answer the empty string if cancelled."

	^ self askWithCancel: questionString initialAnswer: ''

