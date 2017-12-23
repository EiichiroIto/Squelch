scratch processes/events
startProcessFor: topBlock
	"Start a process to run the given block or stack of blocks. Return the new process."

	| sequence proc |
	sequence := topBlock blockSequence.
	sequence first isHatBlock ifTrue: [
		sequence := sequence allButFirst].  "skip hat block"

	topBlock scratchProc ifNotNil: [topBlock stop].

	proc := ScratchProcess new
		topBlock: topBlock;
		expression: sequence.
	topBlock scratchProc: proc.

	(runningBlocks includes: topBlock) ifFalse: [runningBlocks addLast: topBlock].

	^ proc
