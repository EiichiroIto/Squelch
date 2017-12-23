file read/write
installNewProject: newWorkpane
	"Called after creating or reading a new project to clear the process scheduler, pick an object to view, clear the library thumbnails, and perform other housekeeping."

	| viewTarget sb |
	self stopAll.

	newWorkpane class = ScratchStageMorph
		ifFalse: [^ self inform: 'Incompatible Scratch file format'].

	"self exitScratchSession."
	workPane scratchServer ifNotNil: [
		workPane scratchServer clearCaches.
		workPane scratchServer stage: newWorkpane.
		newWorkpane scratchServer: workPane scratchServer].

	newWorkpane isQuarterSize: workPane isQuarterSize.
	newWorkpane bounds: workPane bounds.
	newWorkpane midiPortNum: workPane midiPortNum.
	workPane closeMIDI.

	"use the same sensorboard for the new project"
	sb := workPane sensorBoard.
	newWorkpane submorphs do: [:m |
		(m isKindOf: SensorBoardMorph) ifTrue: [
			sb position: m position.
			newWorkpane replaceSubmorph: m by: sb.
			sb tryToOpenPort]].
	newWorkpane sensorBoard: sb.

	workPane owner replaceSubmorph: workPane by: newWorkpane.
	workPane := newWorkpane.

	self fixByteReversedSounds.

	"fix sprite positions (backward compatability)"
	workPane submorphs do: [:m |
		(m isKindOf: WatcherMorph) ifTrue: [m convertFromOldWatcher].
		(m respondsTo: #costume) ifTrue: [
			m position: m position + m costume rotationCenter]. "fix up positions"
		m layoutChanged].
	workPane layoutChanged.

	"reset timer"
	ScriptableScratchMorph resetTimer.

	"pick an object view, or view the background if there is no other"
	viewTarget := workPane.
	workPane submorphs do: [:m |
		(m respondsTo: #scripts) ifTrue: [
			m scripts size >= viewTarget scripts size ifTrue: [viewTarget := m]]].
	viewTarget viewBlocksAndScripts.

	"populate the sprites list if it is empty (backward compatability)"
	workPane sprites isEmpty ifTrue: [
		workPane submorphs do: [:m |
			(m isKindOf: ScriptableScratchMorph) ifTrue: [workPane sprites addLast: m]]].

	scriptsPane tabPane currentTab: 'Scripts'.
	libraryPane clearLibrary.
	workPane clearPenTrails.
	self updateProjectName.
	ScratchProcess blockHighlightMSecs: 1.
	ScratchPrompterMorph clearLastAnswer.

	(projectInfo at: 'isHosting' ifAbsent: [false]) ifTrue: [
		self enableRemoteSensors].
	(projectInfo at: 'hasMotorBlocks' ifAbsent: [false]) ifTrue: [
		self showMotorBlocks].
	(projectInfo includesKey: 'penTrails') ifTrue: [
		workPane penTrailsForm: (projectInfo at: 'penTrails')].

	Clipboard := nil.
	World cleanseStepList.  "make sure garbage collect can clean up the old sprites"
	Smalltalk garbageCollect.  "get rid of old sprite instances"

	self world ifNotNil: [self world startSteppingSubmorphsOf: self].
	ScriptableScratchMorph scratchOrigin: workPane center.
	justSaved := true.
