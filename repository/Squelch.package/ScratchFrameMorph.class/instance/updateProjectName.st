private
updateProjectName
	"Update the project name display in the Scratch title bar."

	| s |
	projectName ifNil: [projectName := ''].
	projectTitleMorph contents: (self nameFromFileName: projectName).

	projectTitleMorph contents size > 0
		ifTrue: [s := projectTitleMorph contents, '- Scratch']
		ifFalse: [s := 'Scratch ', Version].
	"ScratchPlugin primSetWindowTitle: s."

	self fixLayout.
