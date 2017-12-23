private
addDriveShortcuts: menu
	"Add shortcuts to the file picker menu."

	| drives visible |

	"Include drives"
	menu addLine.
	(Smalltalk os platformName = WindowsResolver platformName)
		ifTrue: [  "Windows"
			drives := FileSystem root directoryNames.
			drives := drives copyWithout: 'Network'.
			drives := drives copyWithout: 'automount/Servers'.
			(visible := ScratchFrameMorph visibleDrives) ifNotNil: [
				drives := drives select: [:drive | visible includes: drive asUppercase]].
			drives do: [:drive | menu add: drive selector: #value: argument: drive]]
		ifFalse: [  "Mac OS X"
			drives := ('/Volumes' asFileReference) directoryNames.
			(visible := ScratchFrameMorph visibleDrives) ifNotNil: [
				drives := drives select: [:drive | visible includes: drive asUppercase]].
			drives := drives do: [:drive |
				menu add: drive selector: #value: argument: '/Volumes/', drive]].
