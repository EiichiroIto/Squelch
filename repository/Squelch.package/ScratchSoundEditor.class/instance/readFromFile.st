menu
readFromFile
	"Read my samples from a file selected by the user."

	| result |
	result := StandardFileMenu oldFileExtensions: #(aif aiff au wav).
	result ifNil: [^ self].
	self readFromFile: result directory pathName, FileDirectory slash, result name.
