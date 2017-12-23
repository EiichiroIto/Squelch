file ops
openAfterLoad
	"Attempt to re-open my file. Do nothing if the file is not found."

	| fullName |
	fullName := self projectDirectory relativeToFullPath: fileName.
	(FileDirectory default fileExists: fullName) ifFalse: [^ self].

	[self basicLoadFile: fileName] ifError: [^ self].
	self currentFrame: currentFrame.
	self updateOutForm.  "update output form for still images"
