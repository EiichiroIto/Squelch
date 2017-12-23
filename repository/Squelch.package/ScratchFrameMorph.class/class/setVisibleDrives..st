utilities
setVisibleDrives: driveListString
	"Set my set of visible drives. If the argument is nil, then all drives are made visible."

	| in drive |
	VisibleDrives := nil.
	driveListString ifNil: [^ self].

	VisibleDrives := OrderedCollection new.
	in := ReadStream on: driveListString.
	[in atEnd] whileFalse: [
		in skipSeparators.
		drive := (in upTo: $,) trimBoth.
		drive size > 0 ifTrue: [VisibleDrives addLast: drive asUppercase]].

	VisibleDrives size > 0
		ifTrue: [VisibleDrives := VisibleDrives asArray]
		ifFalse: [VisibleDrives := nil].
