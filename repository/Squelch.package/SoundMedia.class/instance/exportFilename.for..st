scratch ops
exportFilename: fileName for: stageOrSprite
	"Export my sound to a file with the given name."

	| fName f |
	fName := fileName.
	(fName asLowercase endsWith: '.wav') ifFalse: [fName := fName, '.wav'].
	f := StandardFileStream newScratchFileNamed: fName.
	f ifNil: [^ self].  "could not create or open file for writing"
	f binary.
	originalSound storeWAVSamplesOn: f.
	f close.
