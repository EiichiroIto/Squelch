import/export
parseTranslationLines: lineStream
	"Parse a language translation from the given stream of lines and answer the resulting translation dictionary."

	| result key val comments fuzzy |
	result := Dictionary new.
	"initialComments := OrderedCollection new."
	comments := OrderedCollection new.
	fuzzy := nil.

	"collect all translation diciontary entries"
	[lineStream atEnd] whileFalse: [
		((lineStream peek beginsWith: '# ')
			and: [(#('# BLOCKS' '# USER INTERFACE' '# MIDI INSTRUMENTS' '# FORMATTING') includes: (lineStream peek)) not])
			ifTrue: [comments add: (lineStream next)]
			ifFalse: [(lineStream peek beginsWith: '#, fuzzy')
				ifTrue: [fuzzy := lineStream next]
				ifFalse: [((lineStream peek beginsWith: 'msgid') or: [lineStream peek beginsWith: 'Ôªømsgid']) "BOM"
					ifTrue: [
						key := self extractQuotedStringFrom: lineStream next.
						val := ''.
						[lineStream atEnd not and: [lineStream peek beginsWith: 'msgstr']] whileTrue: [
							val := val, (self extractQuotedStringFrom: lineStream next).
							[lineStream atEnd not and: [lineStream peek beginsWith: '"']] whileTrue:[
								val := val, (self extractQuotedStringFrom: lineStream next)]].
						comments size > 0 ifTrue: [result at: key,'-comments' put: comments].
						fuzzy ifNotNil: [result at: key,'-fuzzy' put: fuzzy].
						result at: key put: val.
						comments := OrderedCollection new.
						fuzzy := nil]
					ifFalse: [lineStream next.
						lineStream atEnd ifTrue: [^ result]]]]].

	^ result
