import/export
importOLPCTranslations
	"Imports translations from the OLPC Pootle translation directory into the Scratch/locale/ directory and renames the .po files"
	"First copy the /scratch/ folder from https://dev.laptop.org/~sayamindu/scratch_translations.zip to the local directory, then run this"
	"self importOLPCTranslations"

	| dir subDir |
	dir := FileDirectory default.
	(dir directoryNames includes: 'scratch')
		ifTrue: [dir := dir directoryNamed: 'scratch']
		ifFalse: [^ self "dialog should say no scratch folder found"].
	dir directoryNames do: [:n |
		subDir := dir directoryNamed: n.
		subDir rename: 'Scratch.po' toBe: (self translationDir fullNameFor: n,'.po')].
