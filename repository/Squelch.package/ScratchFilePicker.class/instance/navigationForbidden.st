private
navigationForbidden
	"Answer true if navigating the file hierarch is forbidden because there is a visibledrives entry in the Scratch.ini file."

	| thisDrive pathParts |
	ScratchFrameMorph visibleDrives ifNil: [^ false].

	thisDrive := ''.
	pathParts := currentDir pathParts.
	pathParts size > 0 ifTrue: [thisDrive := pathParts first asUppercase].
	Smalltalk isMacOSX ifTrue: [
		((thisDrive = 'volumes') and: [pathParts size > 1]) ifTrue: [
			thisDrive := pathParts second asUppercase]].

	(ScratchFrameMorph visibleDrives includes: thisDrive) ifTrue: [^ false].

	self beep.
	^ true
