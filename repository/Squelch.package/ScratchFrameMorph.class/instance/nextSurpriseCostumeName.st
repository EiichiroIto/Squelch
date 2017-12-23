private
nextSurpriseCostumeName
	"Answer a surprise costume name or nil if there are no costumes."
	"Details: Shuffle the list of available costume names and return them one at a time. When there are none left, generate a new shuffle. This avoids repeats."

	| dir ext |
	(shuffledCostumeNames isNil or:
	 [shuffledCostumeNames size = 0]) ifTrue: [
		shuffledCostumeNames := OrderedCollection new: 1000.	
		dir := FileSystem workingDirectory / 'Media' / 'Costumes'.
		dir isDirectory ifTrue: [
		dir allFiles do: [:fr |
			(fr pathString includesSubstring: 'Letters') ifFalse: [
				ext := fr extension asLowercase.
				((ext size > 0) and: [#(gif png jpg) includes: ext])
					ifTrue: [shuffledCostumeNames add: fr pathString]]]]].

	shuffledCostumeNames := shuffledCostumeNames shuffled.
	shuffledCostumeNames size = 0
		ifTrue: [^ nil]
		ifFalse: [^ shuffledCostumeNames removeFirst].
