accessing
codeString
	"Answer a human-readable string representing the code for this block sequence."

	| s |
	s := WriteStream on: (String new: 5000).
	self printCodeOn: s indent: 0.
	^ s contents

