private
printCodeSubmorph: aMorph on: aStream

	(aMorph isKindOf: ArgMorph) ifTrue: [aMorph printArgOn: aStream].
	(aMorph isKindOf: BlockMorph) ifTrue: [
		aStream nextPut: $(.
		aMorph printCodeOn: aStream indent: 0.
		aStream skip: -1.  "remove carriage return"
		aStream nextPut: $)].
	(aMorph isKindOf: StringMorph) ifTrue: [
		((aMorph contents = '?') | (aMorph contents = '%'))
			ifTrue: [aStream skip: -1].	"remove space before ? or %"
		aStream nextPutAll: aMorph contents].
