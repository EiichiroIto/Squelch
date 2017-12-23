menu/button actions
quitScratch
	"Quit from Scratch. Ask the user if they want to save, first."

	| response |
	self closeMediaEditorsAndDialogs ifFalse: [^ self].
	self stopAll.

	(justSaved or: [self projectIsEmpty]) ifFalse: [
		response := ScratchCloseDialog new getUserResponse.
		response = #cancelled ifTrue: [^ self].
		response ifTrue: [
			self saveScratchProjectNoDialog.
			justSaved ifFalse: [^ self]]].

	Smalltalk snapshot: false andQuit: true.
