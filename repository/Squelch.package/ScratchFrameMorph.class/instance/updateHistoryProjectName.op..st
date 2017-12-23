file read/write
updateHistoryProjectName: projName op: operation
	"The given user is about to save or upload a project with the given name. Update the project history. operation is a string specifying the operation."

	| timestamp tab history platform osVersion |
	projectInfo removeKey: 'organization' ifAbsent: [].	"obsolete"
	projectInfo at: 'scratch-version' put: Version.

	timestamp := (Date today printFormat: #(3 2 1 $- 1 1)), ' ', Time now print24.
	tab := String tab.

	history := projectInfo at: 'history' ifAbsent: [''].
	history := history, timestamp, tab.
	history := history, operation, tab, (self nameFromFileName: projName), tab, loginName, tab, author.
	history := history, String cr.
	projectInfo at: 'history' put: history.

	"record other data"
	projectInfo at: 'scratch-version' put: Version.
	projectInfo at: 'language' put: ScratchTranslator currentLanguage.

	platform := Smalltalk os platformName.
	platform ifNil: [platform := 'unknown'].
	'linux' = platform ifTrue: [
		Display extent = (1200@900) ifTrue: [platform := 'XO']].
	projectInfo at: 'platform' put: platform.

	osVersion := Smalltalk os version.
	osVersion ifNil: [osVersion := 'unknown'].
	projectInfo at: 'os-version' put: osVersion.

	(workPane scratchServer notNil and:
	 [workPane scratchServer isHosting])
		ifTrue: [projectInfo at: 'isHosting' put: true]
		ifFalse: [projectInfo removeKey: 'isHosting' ifAbsent: []].

	(self allBlocksString includesSubstring: 'motor')
		ifTrue: [projectInfo at: 'hasMotorBlocks' put: true]
		ifFalse: [projectInfo removeKey: 'hasMotorBlocks' ifAbsent: []].

	workPane penTrailsForm
		ifNil: [projectInfo removeKey: 'penTrails' ifAbsent: []]
		ifNotNil: [projectInfo at: 'penTrails' put: workPane penTrailsForm].

