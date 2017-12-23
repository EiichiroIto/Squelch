menu/button ops
saveScriptsToImage
	"Take a snapshot of all scripts for a sprite and save as a GIF file"

	| fName saveForm |

	saveForm := pageViewerMorph contents screenshot.

	fName := ScratchFileChooserDialog
		chooseNewFileDefault: ''
		title: 'Save Scripts Snapshot'
		type: #scriptsSnapshot.
	fName = #cancelled ifTrue: [^ self].
	fName size = 0 ifTrue: [^ self].

	(fName asLowercase endsWith: '.gif') ifFalse: [fName := fName, '.gif'].
	saveForm writeGIFFileNamed: fName.
