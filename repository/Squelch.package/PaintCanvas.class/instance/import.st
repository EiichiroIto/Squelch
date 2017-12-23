button actions
import
	"Import an image from the image library, or the current directory if there is not image library."

	| fName f spriteOrStage type |
	palette showRotationCenter: false.

	spriteOrStage := self owner originalObject.
	(spriteOrStage isKindOf: ScratchStageMorph)
		ifTrue: [type := #background]
		ifFalse: [type := #costume].
	fName := ScratchFileChooserDialog
		chooseImageFileType: type
		title: 'Import Image'.
	(fName isNil or: [fName = #cancelled]) ifTrue: [^ self].

	(fName asLowercase endsWith: '.sprite')
		ifTrue: [
			f := self importCostumeFromSprite: fName]
		ifFalse: [
			[f := Form fromFileNamed: fName] ifError: [nil]].
	f ifNil: [^ self].

	f := ScratchFrameMorph scaledFormForPaintEditor: f.

	(owner isKindOf: PaintFrame) ifTrue: [owner scaleCanvas: 1].

	self commitMove.  "commit previous move, if any"
	palette mode: #move.
	moveOrStampForm := f.
	selectionRect := ((canvasForm extent - f extent) // 2) extent: f extent.
