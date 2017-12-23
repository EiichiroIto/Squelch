accessing
hasTextLayer
	"Return true if I have a text layer."

	^ textBox notNil and: [textBox contents size > 0]
