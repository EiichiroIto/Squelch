startup
processSettingsFile
	"Process settings from the Scratch.ini file."

	| lang settings k |
	self class setVisibleDrives: nil.
	lang := nil.
	ScratchFileChooserDialog clearFolderCache. "clear homeDir and last folder cache"
	settings := self readSettingsFile.
	settings associationsDo: [:assoc |
		k := assoc key.
		k = 'language' ifTrue: [lang := assoc value].
		k = 'home' ifTrue: [ScratchFileChooserDialog setHomeDir: assoc value].
		k = 'visibledrives' ifTrue: [self class setVisibleDrives: assoc value]].

	lang ifNil: [lang := ScratchTranslator guessLanguage].
	self setLanguage: lang.
