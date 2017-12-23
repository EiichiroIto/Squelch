testing
atMin
	"answer true if the target sprite cannot be made any smaller"

	| minExtent|
	minExtent := target costumeForm extent min: 10@10.
	^(target extent x <= minExtent x) or: [target extent y <= minExtent y].
