accessing
scratchInfoClient: anObject
	"Set the object to be informed when a Scratch project file with an info dictionary is selected. The client will be sent the message #scratchInfo: once each time such a file is selected, allowing the project thumbnail and other project information to be displayed."

	scratchInfoClient := anObject.
