event handling
mouseUp: evt
	"View my target if it is not already beeing viewed."

	| frame |
	frame := self meOrOwnerThatIsA: ScratchFrameMorph.
	frame ifNil: [^ self].
	self target ifNil: [^ self]. "deleted"

	self select.
	frame scriptsPane target = self target ifFalse: [
		self target viewBlocksAndScripts].
