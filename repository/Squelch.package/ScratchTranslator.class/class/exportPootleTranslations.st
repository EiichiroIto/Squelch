import/export
exportPootleTranslations
	"Exports translations from the locale folder into a new localeForPootle directory with a different subdirectory structure"
	"Need to figure out how to overwrite files without getting a permission dialog"
	"self exportPootleTranslations"

	| defaultDir localeDir localeForPootleDir fs dirName sdir |
	defaultDir := FileDirectory default.
	(defaultDir directoryNames includes: 'locale')
		ifTrue: [localeDir := self translationDir]
		ifFalse: [^ self "dialog should say no locale folder found"].
	localeForPootleDir := defaultDir directoryNamed: 'translate.scratch.mit.edu'.
	localeForPootleDir := localeForPootleDir directoryNamed: 'scratch'.
	localeDir fileNames do: [:n |
		(n endsWith: '.po') ifTrue: [
			dirName := (n copyFrom: 1 to: n size - 3).
			sdir := localeForPootleDir directoryNamed: dirName.
			fs := sdir newFileNamed: n.
			fs nextPutAll: (localeDir fileNamed: n) contentsOfEntireFile.
			fs close]].
