import/export
importPootleTranslations
	"Imports translations from the LLK Pootle translation directory into the Scratch/locale/ directory"
	"First checkout svn://translate.scratch.mit.edu:52400 to the local directory, then run this"
	"self importPootleTranslations"

	| dir subDir fs |
	dir := FileDirectory default.
	(dir directoryNames includes: 'translate.scratch.mit.edu')
		ifTrue: [dir := dir directoryNamed: 'translate.scratch.mit.edu'.
			(dir directoryNames includes: 'scratch')
				ifTrue: [dir := dir directoryNamed: 'scratch']
				ifFalse: [^ self "dialog should say no scratch folder found"]]
		ifFalse: [^ self "dialog should say no scratch folder found"].
	dir directoryNames do: [:n |
		(n = '.svn') ifFalse: [
			subDir := dir directoryNamed: n.
			fs := self translationDir newFileNamed: n,'.po'.
			fs nextPutAll: (subDir fileNamed: n,'.po') contentsOfEntireFile.
			fs close]].
