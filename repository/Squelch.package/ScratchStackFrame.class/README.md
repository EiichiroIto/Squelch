A ScratchStackFrame describes the state of a ScratchProcess.

Each ScratchProcess has a pointer to a ScratchStackFrame containing its state. Whenever the ScratchProcess yields control, its ScratchStackFrame tells it exactly where it left off.

Structure:
  parentFrame	the ScratchStackFrame to return to when this one has been evaluated.
  expression		ArgMorph, BlockMorph, a collection of blocks to evaluate,
					#shouldYield or #returnMarker
  arguments		the OrderedCollection of arg values computed so far (if expression is a BlockMorph)
  pc				the index of the next block to evaluate (if expression is a Collection)
  startTime		the time at which evaluation began (if expression is a timed CommandBlockMorph)
  startValue		the starting value for interpolation (if expression is a timed CommandBlockMorph)
  shouldUnlight	a Boolean that indicates if we should unlight the current expression (a block)
