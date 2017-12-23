testing
writeTestFile
	"self writeTestFile"

	| all objects s |
	all := OrderedCollection new.
	all add: true.
	all add: false.
	all add: 12345.
	all add: 123.
	all add: 123456789123456789.
	all add: -123456789123456789.
	all add: 123.546.
	all add: 'This is a string.'.
	all add: #thisIsASymbol.
	all add: #(100 101 102 253 254 255) asByteArray.
	all add: ScriptableScratchMorph popSound samples.
	all add: (ImageMorph defaultForm asFormOfDepth: 32) bits.
	all add: (Array with: 1 with: 2 with: 3).
	all add: (Array with: 1 with: 2 with: 3) asOrderedCollection.
	all add: (Array with: 1 with: 2 with: 3) asSet.
	all add: (IdentitySet withAll: (Array with: 1 with: 2 with: 3)).
	all add: (Dictionary new at: 'John' put: 'Maloney'; at: 'Lise' put: 'Kreps'; yourself).
	all add: (IdentityDictionary new at: #John put: 'Maloney'; at: #Lise put: 'Kreps'; yourself).
	all add: (Color gray: 0.5).
	all add: (Color red alpha: 0.5).
	all add: 1@2.0.
	all add: (9.5@20 extent: 30@40).
	all add: (ImageMorph defaultForm asFormOfDepth: 32).
	all add: ImageMorph defaultForm.

	objects := (Array with: nil), all asArray.
	s := (FileStream newFileNamed: 'test.obj') binary.
	self new storeObj: objects on: s.
	s close.
