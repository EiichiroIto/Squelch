private
addShortcut: dir named: name toMenu: menu
	"Adds one of the Scratch default folders to the file picker menu, if it is not the current directory."

	dir ifNil: [^ self].
	(currentDir isKindOf: ScratchServerDirectory) "keep this check separate since a ScratchServerDirectory does not respond to pathName"
		ifTrue: [^ menu add: name action: dir pathName].
	(dir pathName ~= currentDir pathName)
		ifTrue: [^ menu add: name action: dir pathName].
