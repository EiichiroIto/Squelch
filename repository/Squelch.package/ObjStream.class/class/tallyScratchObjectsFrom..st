testing
tallyScratchObjectsFrom: aDirectory
	"Tally the object class ID's for all Scratch projects in the given directory into the given array."
	"self tallyScratchObjectsFrom: FileDirectory default"

	| classIDCounts objTable id result count cName |
	classIDCounts := Array new: 256 withAll: 0.
	aDirectory fileNames do: [:fn |
		(fn endsWith: '.sb') ifTrue: [
			objTable := self scratchObjectsFrom: (aDirectory fullNameFor: fn).
			objTable do: [:entry |
				id := entry at: 2.
				classIDCounts at: id put: (classIDCounts at: id) + 1]]].

	result := WriteStream on: String new.
	1 to: classIDCounts size do: [:i |
		count := classIDCounts at: i.
		count > 0 ifTrue: [
			cName := (IDToClassEntry at: i) at: 2.
			result nextPutAll: cName, '	', count printString; cr]].
	^ result contents
