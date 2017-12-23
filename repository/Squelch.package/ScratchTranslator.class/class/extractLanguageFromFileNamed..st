import/export
extractLanguageFromFileNamed: aFilename
	"Return the UTF8 value of the 'Language-Name:' header from the file with the given name, or nil if the file does not exist or it does not include that header."
	"self extractLanguageFromFileNamed: (self translationDir fullNameFor: 'Scratch.pot')"

	| f s i line lang nextLine lineSize |
	f := FileStream readOnlyFileNamed: aFilename.
	f ifNil: [^ nil].
	s := f contentsOfEntireFile.
	i := 0.
	[true] whileTrue: [
		i := s findString: 'language-name' startingAt: i + 1 caseSensitive: false.
		i = 0 ifTrue: [^ nil].
		line := (self withoutComment: (self lineOf: s containingIndex: i)) trimBoth.
		lineSize := line size.
		((line size > 0) and: [line first = $m and: [line last = $"]]) ifTrue: [
			line := (self extractQuotedStringFrom: line) trimBoth.
			(line asLowercase beginsWith: 'language-name') ifTrue: [
				nextLine := (self withoutComment: (self lineOf: s containingIndex: (i + lineSize))) trimBoth.
				lang := (nextLine copyFrom: 9 to: (nextLine size - 1)) trimBoth.
				^ lang]]].
	^ nil