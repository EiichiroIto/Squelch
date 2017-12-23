language translation
importLanguagesList
	"Import the list of languages and language codes translated for Scratch by file names from 'Help/Translations'"

	| dir code lang |
	ISODict := Dictionary new.
	ISODict at: 'en' put: 'English'.
	dir := self translationDir.
	dir fileNames do: [:f |
		(f endsWith: '.po') ifTrue: [
			code := f copyFrom: 1 to: (f size - 3).
			lang := self extractLanguageFromFileNamed: (dir / f) pathString.
			lang ifNil: [lang := code].
			self insertISOCode: code forLanguage: lang]].
