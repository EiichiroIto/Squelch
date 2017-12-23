menu
readDataFromFile

	| result fName |
	result := StandardFileMenu oldFileExtensions: #(aif aiff au wav).
	result ifNil: [^ self].
	fName :=  result directory pathName, FileDirectory slash, result name.
	self data: (SampledSound fromFileNamed: fName) samples.

