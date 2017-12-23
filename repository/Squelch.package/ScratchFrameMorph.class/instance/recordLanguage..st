private
recordLanguage: aString
	"Record my language in the settings file."
	"ScratchFrameMorph new recordLanguage: 'English'"
 
	| fName f sz settings all |
	fName := (FileSystem workingDirectory / 'Scratch.ini') pathString.
	f := FileStream concreteStream new open: fName forWrite: true.
	f ifNil: [^ self].
	sz := f size.
	settings := (f next: sz) lines.
	settings := settings reject: [:s | s asLowercase beginsWith: 'language='].
	settings := settings reject: [:s | all := s asByteArray asSet. (all size = 1) and: [all asArray first = 0]].
	settings := settings copyWith: ('Language=', aString).
	f position: 0.
	settings do: [:s | f nextPutAll: s, String crlf].
	[f position < sz] whileTrue: [f nextPut: 0 asCharacter].
	f close.
