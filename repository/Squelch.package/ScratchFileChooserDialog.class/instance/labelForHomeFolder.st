shortcuts
labelForHomeFolder
	"Answer the name to use for the home folder. This is the user name unless the home folder location has been overridden by an entry in the Scratch.ini file."

	UserHomeFolder notNil
		ifTrue: [ ^ 'Home' localized ].
	^ FileLocator home asFileReference path segments last