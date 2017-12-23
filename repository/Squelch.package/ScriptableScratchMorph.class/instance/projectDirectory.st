private
projectDirectory
	"Answer the directory containing this Scratch project or the default directory."

	| frame |
	(frame := self meOrOwnerThatIsA: ScratchFrameMorph) ifNil: [^ FileSystem workingDirectory].
	^ frame projectDirectory
