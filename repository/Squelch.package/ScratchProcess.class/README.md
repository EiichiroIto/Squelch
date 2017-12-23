A ScratchProcess is what brings a stack of blocks to life. The process keeps track of which block to run next, evaluates block arguments, handles control structures, and so forth.

The ScratchFrameMorph is the scheduler, telling each process when to run by calling its runStep method. The runStep method will execute some number of blocks, then voluntarily yield control so that the ScratchFrameMorph can run another process. The etiquette is that a process should yield control at the end of every loop iteration, and while it is running a timed command (e.g. "wait 5 secs") or a synchronous command (e.g. "broadcast xxx and wait").

Structure:
  stackFrame		the ScratchStackFrame describing the current state of this process
  readyToYield		boolean indicating whether to yield control to another process
  errorFlag			boolean indicating whether an error was encountered
  readyToTerminate	boolean indicating whether the stop method has been called
