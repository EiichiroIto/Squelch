file read/write
unusedNameStartingWith: prefix in: aFileReference
	"Answer an unused file or directory name in this directory starting with the given prefix and ending with one or more digits."
	"FileDirectory default unusedNameStartingWith: 'tmp'"

	| usedNames i result |
	usedNames := (aFileReference entries collect: [ :each | each basename ]) asSet.
	i := 0.
	result := prefix, '0'.
	[usedNames includes: result] whileTrue: [
		result := prefix, (i := i + 1) printString].
	^ aFileReference / result