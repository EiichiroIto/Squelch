private
directoryMenu
	"Present a drop-down menu of all directories in my current path."

	| menu pathParts prefix n serverEntries choice s serverPath entry2 str |
	self navigationForbidden ifTrue: [^ self].

	menu := MenuMorph new.
	menu target: [ :v | choice := v ].
	pathParts := currentDir path segments.
	prefix := ''.
	n := 1.
	pathParts do: [:part |
		menu add: prefix, part selector: #value: argument: n.
		prefix := prefix ,'  '.
		n := n + 1].
	pathParts isEmpty ifTrue: [menu add: 'Computer' selector: #value: argument: FileSystem root pathString].

	self addDriveShortcuts: menu.

	"if opening a Scratch project, allow access to servers"
	scratchInfoClient ifNotNil: [
		serverEntries := ScratchFrameMorph scratchServers.
		serverEntries size > 0 ifTrue: [
			menu addLine.
			serverEntries do: [:entry |
				menu add: entry first action: n.
				n := n + 1]]].
	menu invokeAt: (directoryBarMorph right - 117)@(directoryBarMorph top + 8) in: self world.
	choice ifNil: [^ self].

	(choice isKindOf: String) ifTrue: [
		choice = 'Computer'
			ifTrue: [^ self currentDirectory: '']
			ifFalse: [^ self currentDirectory: choice contents]].

	choice > pathParts size ifTrue: [
		entry2 := serverEntries at: choice - pathParts size.
		^ self currentDirectory: (ScratchServerDirectory new
			serverName: (entry2 at: 2);
			path: (entry2 at: 3))].

	s := WriteStream on: String new.
	1 to: choice do: [:i |
		s nextPutAll: (pathParts at: i).
		i < choice ifTrue: [s nextPut: currentDir path delimiter]].

	(currentDir isKindOf: ScratchServerDirectory)
		ifTrue: [
			serverPath := '/', s contents.
			(serverPath endsWith: '/') ifFalse: [serverPath := serverPath, '/'].
			self currentDirectory: (currentDir copy path: serverPath)]
		ifFalse: [
			str := s contents.
			Smalltalk os isWindows ifFalse: [ str := FileSystem disk delimiter asString, str ].
			self currentDirectory: str].
