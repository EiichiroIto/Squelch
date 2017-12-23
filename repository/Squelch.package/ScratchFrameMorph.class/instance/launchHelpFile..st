menu/button actions
launchHelpFile: aFilename

	| helpDir subDir browser |
	browser := Smalltalk globals at: #WebBrowser ifAbsent: [ ^ self ].

	(FileSystem workingDirectory / 'Help') isDirectory ifFalse: [^ self beep].  "no help folder"
	self stopAll.
	helpDir := (FileSystem workingDirectory / 'Help').

	"use the English subfolder by default if it exists"
	(helpDir / 'en') isDirectory ifTrue: [subDir := helpDir / 'en'].
	"use subfolder for the current language if it exists"
	(helpDir / ScratchTranslator currentLanguage) isDirectory ifTrue: [
		subDir := helpDir / ScratchTranslator currentLanguage].
	subDir ifNotNil: [helpDir := subDir].

	(helpDir / aFilename) isFile
		ifTrue: [Smalltalk os isMacOSX
			ifTrue: [browser openOn: 'file://', (helpDir / aFilename)  pathString]
			ifFalse: [browser openOn: (helpDir / aFilename) pathString]]
		ifFalse: [
			DialogBoxMorph inform: 'Scratch help file not found.' localized].
