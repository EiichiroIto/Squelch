other
exportFilename: fileName for: stageOrSprite
	"Export my image to a file with the given name. Save sprite costumes as GIF's, dropping color resolution if necessary."

	| myForm f fName |
	myForm := self compositeForm.

	"save as GIF if image has under 256 colors"
	((myForm depth <= 8) or: [myForm couldBeColorReduced]) ifTrue: [
		f := myForm colorReduced8Bit.
		(fileName asLowercase endsWith: '.gif')
			ifTrue: [fName := fileName]
			ifFalse: [fName := fileName, '.gif'].
		GIFReadWriter putForm: f onFileNamed: fName.
		^ self].

	"otherwise, save as BMP to retain color resolution"
	(fileName asLowercase endsWith: '.bmp')
		ifTrue: [fName := fileName]
		ifFalse: [fName := fileName, '.bmp'].

	(stageOrSprite isKindOf: ScratchSpriteMorph)
		ifTrue: [
			f := Form extent: myForm extent depth: 32.
			f fillColor: Color white.  "BMP cannot handle transparency; use white as BG color"
			myForm displayOn: f at: form offset negated rule: Form paint]
		ifFalse: [
			f := myForm asFormOfDepth: 32].

	f writeBMPFileNamed: fileName.
