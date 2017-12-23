event handling
mouseDown: evt
	"Record whether the mouse went down in the currently highlit entry (wasSelected) and if it should be considered a double-click. See mouseUp: for details."

	evt hand newKeyboardFocus: self.
	wasSelected := self highlightEntryAt: evt cursorPoint.
	isDoubleClick :=
		(wasSelected and:
		 [lastUpMSecs notNil and:
		 [(Time millisecondClockValue - lastUpMSecs) < 1000]]).

	isDoubleClick ifFalse: [
		scratchInfoClient ifNotNil: [self reportScratchProjectInfo ]]