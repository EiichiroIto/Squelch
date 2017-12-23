other
presentHelpScreen: aStringOrNil
	"Look for a help screen with the given name in the 'Help' folder. If found, present it to the user."

	| helpDir subDir fileNames helpFileName helpForm |
	aStringOrNil ifNil: [^ self beep].

	(FileDirectory default directoryNames includes: 'Help') ifFalse: [^ self beep].  "no help folder"
	helpDir := FileDirectory default directoryNamed: 'Help'.

	"use the English subfolder by default if it exists"
	(helpDir directoryNames includes: 'en') ifTrue: [subDir := helpDir directoryNamed: 'en'].
	"use subfolder for the current language if it exists"
	(helpDir directoryNames includes: ScratchTranslator currentLanguage) ifTrue: [
		subDir := helpDir directoryNamed: ScratchTranslator currentLanguage].
	subDir ifNotNil: [helpDir := subDir].

	fileNames := helpDir fileNames collect: [:s | s asLowercase].

	helpFileName := nil.
	#(hlp gif png jpg bmp) do: [:ext |
		helpFileName ifNil: [
			helpFileName := aStringOrNil, '.', ext.
			(fileNames includes: helpFileName asLowercase)
				ifFalse: [helpFileName := nil]]].
	helpFileName ifNil: [^ self beep].

	World doOneCycle.  "update cursor before fetching helpForm"
	[helpForm := Form fromFileNamed: (helpDir fullNameFor: helpFileName)]
		ifError: [^ self beep].

	HelpDialog showForm: helpForm.
