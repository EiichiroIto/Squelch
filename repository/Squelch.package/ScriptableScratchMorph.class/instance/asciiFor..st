sensing ops
asciiFor: keyName

	| localizedKey |
	keyName size = 1 ifTrue: [^ keyName first asciiValue].

	localizedKey := keyName localized.
	'space' localized = localizedKey ifTrue: [^ Character space asciiValue].
	'enter' localized = localizedKey ifTrue: [^ Character cr asciiValue].
	'up arrow' localized = localizedKey ifTrue: [^ 30].
	'down arrow' localized = localizedKey ifTrue: [^ 31].
	'right arrow' localized = localizedKey ifTrue: [^ 29].
	'left arrow' localized = localizedKey ifTrue: [^ 28].

	"needed to support old projects:"
	'up' = keyName ifTrue: [^ 30].
	'down' = keyName ifTrue: [^ 31].
	'right' = keyName ifTrue: [^ 29].
	'left' = keyName ifTrue: [^ 28].

	^ -1  "no match; should never happen"
