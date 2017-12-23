utilities
quitFromMenu
	"The user is using the application menu to quit from Scratch. If there is an open Scratch window, ask the user about saving the project. Otherwise, confirm that the user really wants to quit."

	| scratchWindow |
	scratchWindow := World submorphs detect: [:m | (m isKindOf: self)] ifNone: [nil].
	scratchWindow
		ifNil: [World hands first quitSession]
		ifNotNil: [scratchWindow quitScratch].
