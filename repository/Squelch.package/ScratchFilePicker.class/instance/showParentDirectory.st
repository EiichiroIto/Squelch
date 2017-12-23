private
showParentDirectory
	"Go to my parent directory."

	self navigationForbidden ifTrue: [^ self].

	self currentDirectory: currentDir parent
