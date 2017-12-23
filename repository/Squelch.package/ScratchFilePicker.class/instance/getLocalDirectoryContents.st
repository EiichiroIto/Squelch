private
getLocalDirectoryContents
	"Generate and layout the morphs in my contents pane from the files and folder in the current local directory."

	| allNames fileNames dirNames ext page |
	"make an alphabetized list of all files and directory names"
	fileNames := currentDir fileNames.
	extensions ifNotNil: [  "filter out files without a matching extension"
		fileNames := fileNames select: [:n |
			extensions includes: (currentDir / n) extension asLowercase]].
	fileNames := fileNames sort: [:n1 :n2 | n1 caseInsensitiveLessOrEqual: n2].
	dirNames := self getLocalDirectoryNames.
	dirNames := dirNames sort: [:n1 :n2 | n1 caseInsensitiveLessOrEqual: n2].
	allNames := dirNames , fileNames.
	allNames := allNames reject: [:n | n endsWith: '_th.gif'].					"suppress Scratch project thumbnails"
	allNames := allNames reject: [:n | n beginsWith: '.'].						"suppress hidden files on Mac OS X and Unix"
	allNames := allNames reject: [:n |
		ext := (currentDir / n) extension asLowercase.
		#(app dll exe ini image changes) includes: ext].
	"allNames := allNames reject: [:n | ScratchPlugin isHidden: (currentDir fullNameFor: n)]."	"suppress hidden files/folders on Win32"

	currentDir pathString = FileSystem workingDirectory pathString ifTrue: [
		allNames := allNames reject: [:fn |
			#(help icons 'license.txt' locale plugins 'scratch.app' ) includes: fn asLowercase]].

	showThumbnails
		ifTrue: [page := self thumbnailStylePageFor: allNames]
		ifFalse: [page := self listStylePageFor: allNames].
	contentsPaneMorph contents: page.

	showThumbnails ifTrue: [self startThumbnailFetchProcess].
	self changeSelectionIndexBy: 1.
