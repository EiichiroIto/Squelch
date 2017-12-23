sensing ops
keyPressed: keyName

	| ch |
	ch := self asciiFor: keyName.
	"Transcript cr; show: 'keyName='; show: keyName; show: ' ch='; show: ch."
	(HandMorph keyPressed: ch) ifTrue: [^ true].

	"if key is a letter, check the opposite case"
	(ch between: $a asciiValue and: $z asciiValue) ifTrue: [
		^ HandMorph keyPressed: ch - 32].
	(ch between: $A asciiValue and: $Z asciiValue) ifTrue: [
		^ HandMorph keyPressed: ch + 32].

	^ false
