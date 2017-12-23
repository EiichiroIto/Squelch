testing
tallyScratchObjectsFromFile: aFileName
	"Read the Scratch project from the file with the given name and tally it's object class IDs."

	| classIDCounts objTable id result count cName |
	classIDCounts := Array new: 256 withAll: 0.
	objTable := self scratchObjectsFrom: aFileName.
	objTable do: [:entry |
		id := entry at: 2.
		classIDCounts at: id put: (classIDCounts at: id) + 1].

	result := WriteStream on: String new.
	1 to: classIDCounts size do: [:i |
		count := classIDCounts at: i.
		count > 0 ifTrue: [
			cName := (IDToClassEntry at: i) at: 2.
			result nextPutAll: cName, '	', count printString; cr]].
	^ result contents

