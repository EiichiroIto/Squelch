import/export
translationDir
	"Returns the directory which contains the translation files and creates it if it doesn't exist."
	
	| dir |
	dir := FileSystem workingDirectory.
	(dir directoryNames includes: 'locale')
		ifFalse: [[(dir / 'locale') createDirectory] ifError: [^ dir]].
	dir := dir / 'locale'.

	^ dir
