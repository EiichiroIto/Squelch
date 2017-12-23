private
newDirectory
	"Create a new directory."

	| name |
	name := StringDialog askWithCancel: 'New folder name:'.
	name = '' ifTrue: [^ self].
	[(self currentDirectory / name) createDirectory] ifError: [:err :rcvr |
		^ DialogBoxMorph warn: 'Could not create folder.'].
	self currentDirectory: self currentDirectory.
