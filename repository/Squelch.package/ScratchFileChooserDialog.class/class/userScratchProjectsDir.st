accessing
userScratchProjectsDir
	"Return the path to the user's 'Scratch' project folder, usually located inside the user's 'Documents' folder. If the folder does not already exists, attempt to create it. If the .ini file specifies an alternate home directory, create the folder there. If the directory can't be created, return the user's home folder."

	| scratchFolderName homeDir dir |
	scratchFolderName := 'Scratch Projects'.  "if this were localized a user could get multiple project folders for different languages..."

	homeDir := self homeDir.

	"try to create Scratch Projects folder in the user's homeDir"
	dir := homeDir asFileReference / scratchFolderName.
	dir isDirectory ifFalse: [
		[dir createDirectory] ifError: []].

	^ dir isDirectory
		ifTrue: [dir]
		ifFalse: [homeDir]
