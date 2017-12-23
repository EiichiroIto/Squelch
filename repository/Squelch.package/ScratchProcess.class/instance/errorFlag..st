accessing
errorFlag: aBoolean
	"Set the error flag for this process."

	errorFlag := aBoolean.
	stackFrame expression showError.
	stackFrame expression topBlock showErrorFeedback.
