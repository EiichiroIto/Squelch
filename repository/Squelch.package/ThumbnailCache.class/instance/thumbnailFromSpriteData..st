other
thumbnailFromSpriteData: aByteArray
	"Answer a thumbnail for the sprite stored in the given ByteArray (the contents of a binary file)."

	| s version proj sprite scriptCount f scale thumbF spriteBlock p label labelForm |
	s := ReadStream on: aByteArray.

	version := ObjStream scratchFileVersionFrom: (s next: 10) asString.
	version = 0 ifTrue: [
		s position: 0.
		proj := ObjStream new readObjFrom: s showProgress: false].
	(version = 1) | (version = 2) ifTrue: [
		s skip: s uint32.  "skip header"
		proj := ObjStream new readObjFrom: s showProgress: false].

	proj class = ScratchStageMorph ifFalse: [^ nil].
	sprite := proj submorphs detect: [:m | m isKindOf: ScriptableScratchMorph] ifNone: [^ nil].
	f := sprite costumeForm asFormOfDepth: 16.
	scale := (56.0 / f width) min: (42.0 / f height).
	f := f magnifyBy: scale.
	thumbF := Form extent: 80@60 depth: 16.
	f displayOn: thumbF at: ((thumbF width - f width) // 2) @ 0 rule: Form paint.
	spriteBlock := ScratchFrameMorph skinAt: #spriteBlock.
	p := ((thumbF width - spriteBlock width) // 2) @ (thumbF height - spriteBlock height).
	spriteBlock displayOn: thumbF at: p rule: Form paint.

	scriptCount := self scriptCountFor: sprite.
	label := 'Scripts' localized, ScratchTranslator colonSuffix, ' ', scriptCount printString.
	scriptCount = 0 ifTrue: [label := 'no scripts' localized].
	scriptCount = 1 ifTrue: [label := '1 script' localized].
	labelForm := (StringMorph contents: label font: (StrikeFont fontName: 'Verdana' size: 10)) imageForm.
	labelForm displayOn: thumbF at: p + (((spriteBlock width - labelForm width // 2) + 1)@ 5) rule: Form paint.

	^ thumbF
