accessing
homeDir
	"Return the home directory for this user. By default, this is either provided by the OS via primGetFolderPath: but it can be overridden by adding a 'homedir=path' entry to the Scratch.ini folder."

	UserHomeFolder ifNotNil: [^ UserHomeFolder]. "provided by Scratch.ini"

	^ FileLocator documents asFileReference