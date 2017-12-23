accessing
rotatedForm
	"Answer my rotated and scaled form."

	rotatedForm ifNil: [self costumeChanged].
	^ rotatedForm
