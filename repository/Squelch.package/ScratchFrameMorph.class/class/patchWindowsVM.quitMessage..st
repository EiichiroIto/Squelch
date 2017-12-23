utilities
patchWindowsVM: vmFileName quitMessage: aString
	"Modify the Squeak application (the .exe file) for Windows to display the given string when you quit. You must start with a copy of the original VM, not one that has already been modified. This file will be modified in place, so make sure you keep a copy of the original! The string is truncated to 27 characters since it must fit into the space of the original quit message."
	"self patchWindowsVM: 'Scratch.exe' quitMessage: 'Want to quit Scratch now?'"

	| orig firstOrigByte replacement f found startPos |
	orig := 'Quit Squeak without saving?' asByteArray.
	firstOrigByte := orig first.

	replacement := aString asByteArray copyFrom: 1 to: (aString size min: orig size).
	replacement size < orig size ifTrue: [  "pad with zeros to the same size as the original"
		replacement := replacement, (ByteArray new: orig size - replacement size withAll: 0)].

	f := (FileStream oldFileNamed: vmFileName) binary.

	found := false.
	[f atEnd | found] whileFalse: [
		[f atEnd not and: [f next ~= firstOrigByte]] whileTrue.  "scan for first byte"
		startPos := f position - 1.
		f position: startPos.
		found := true.
		1 to: orig size do: [:i | f next = (orig at: i) ifFalse: [found := false]]].

	found ifTrue: [  "over-write the original message with the replacement"
		f position: startPos.
		replacement do: [:byte | f nextPut: byte]].

	f position: f size.  "position to end of file to avoid possible file truncation"
	f close.

	found
		ifTrue: [self inform: 'New quit message installed']
		ifFalse: [self inform: 'Original quit message not found; no change made'].

