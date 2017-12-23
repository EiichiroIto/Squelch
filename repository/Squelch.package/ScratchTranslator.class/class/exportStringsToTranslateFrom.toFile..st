import/export
exportStringsToTranslateFrom: aDictionary toFile: fName
	"Export the strings to be translated either to Scratch.pot or an existing translation (.po) file."
	"self resetUITranslationSet. self resetMIDITranslationSet. self exportStringsToTranslateFrom: nil toFile: nil"
	"self resetMIDITranslationSet. self exportStringsToTranslateFrom: (self importTranslation: 'es.po') toFile: 'exportTest.po'"

	| dir fn header f sections templateDict title keys comments |

	self setLanguage: 'en'.
	header := HeaderString.
	dir := self translationDir.
	fn := fName.
	fn ifNil: [fn := self templateFilename].
	(dir fileExists: fn) ifTrue: [  "extract the existing header, then delete the old .po file"
		aDictionary ifNotNil: [
			header := aDictionary at: '' ifAbsent: [''].
			dir deleteFileNamed: (dir fullNameFor: fn)]].
	f := FileStream newFileNamed: (dir fullNameFor: fn).
	"f nextPutAll: #(239 187 191) asByteArray asString."  "UTF8 byte-order mark - removed for now (Pootle)"

	"header comments are stored as '-comments' because the header key is the empty string"
	aDictionary ifNotNil: [
		comments := aDictionary at: '-comments' ifAbsent: [#()].
		comments do: [:s | f nextPutAll: s; crlf]].

	"header is stored as a multi-line translation entry for the empty string"
	self export: 'msgid' value: '' to: f.
	self export: 'msgstr' value: header to: f.
	f crlf.

	sections := {
		{'FORMATTING'.			self formattingHeaderFields}.
		{'BLOCKS'.				ScriptableScratchMorph blockSpecsForTranslation}.
		{'USER INTERFACE'.		self uiTranslationSetAsSortedArray}.
 		{'MIDI INSTRUMENTS'.	self midiTranslationSet asArray sort}
	}.

	aDictionary ifNotNil: [templateDict := self importTranslation: self templateFilename].

	sections do: [:pair |
		title := pair first.
		keys := pair second asOrderedCollection.
		f nextPutAll: '############################################'; crlf.
		f nextPutAll: '# ', title; crlf.
		f nextPutAll: '############################################'; crlf.
		f crlf.

		((title = 'FORMATTING') and: [aDictionary isNil]) ifTrue: [
			f nextPutAll: self formattingSectionForPOT.
			keys := OrderedCollection new].

		keys removeAll: self doNotTranslate.
		keys do: [:k |
			(aDictionary isNil or: [templateDict includesKey: k]) ifTrue: [
				"COMMENTS"
				comments := #().
				(templateDict notNil and: [templateDict includesKey: k,'-comments'])
					ifTrue: [ "use the comment from template .pot file if there is one"
						comments := (templateDict at: k, '-comments')]
					ifFalse: [ "else use the comment from the translation file"
						aDictionary ifNotNil: [
							comments := aDictionary at: k, '-comments' ifAbsent: [#()]]].
				comments do: [:s | f nextPutAll: s; crlf].

				"FUZZY TAG"
				(aDictionary notNil and: [aDictionary includesKey: k, '-fuzzy'])
					ifTrue: [f nextPutAll: '#, fuzzy'; crlf].

				"KEY"
				self export: 'msgid' value: k to: f.

				"TRANSLATION"
				(aDictionary notNil and: [aDictionary includesKey: k])
					ifTrue: [
						self export: 'msgstr' value: (aDictionary at: k) to: f]
					ifFalse: [
						(aDictionary notNil and: [aDictionary includesKey: k asLowercase])
							ifTrue: [  "TEMPORARY CAPITALIZATION HACK"
								self export: 'msgstr' value: (aDictionary at: k asLowercase) to: f]
							ifFalse: [
								(aDictionary notNil and: [(k endsWith: '?') and: [aDictionary includesKey: (k copyFrom: 1 to: k size - 1)]])
									ifTrue: [  "TEMPORARY QUESTION HACK"
										self export: 'msgstr' value: (aDictionary at: (k copyFrom: 1 to: k size - 1)) to: f]
									ifFalse: [  "BLANK TRANSLATION"
										self export: 'msgstr' value: '' to: f]]].
				f crlf]]].
	f close.
