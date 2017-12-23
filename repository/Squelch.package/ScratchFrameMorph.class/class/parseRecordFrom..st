utilities
parseRecordFrom: lineStream
	"An HTML table record from the given stream of lines."

	| rec ln buf |
	rec := OrderedCollection new.
	[true] whileTrue: [
		ln := lineStream next.
		ln = '</tr>' ifTrue: [^ rec].
		(ln beginsWith: '<td>') ifTrue: [
			buf := ln copyFrom: 5 to: ln size.
			[lineStream atEnd | (buf endsWith: '</td>')] whileFalse: [buf := buf, ' ', lineStream next].
			buf := buf copyFrom: 1 to: buf size - 5.
			rec addLast: buf]].
	^ rec
