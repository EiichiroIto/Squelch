private
copyRecordingIn: dict
	"Copy my fields and scripts."

	| newCopy newBlocksBin |
	(self respondsTo: #sayNothing) ifTrue: [self sayNothing].  "remove talk bubble before copying"
	newCopy := super copyRecordingIn: dict.
	newCopy renewFilterPack.
	newBlocksBin := blocksBin fullCopy.
	newBlocksBin allMorphsDo: [:m |
		(m isKindOf: HatBlockMorph) ifTrue: [m scriptOwner: newCopy].
		(m isKindOf: CommandBlockMorph) ifTrue: [m mapReceiver: self to: newCopy]].
	newCopy vars: vars copy lists: (self copyListsFor: newCopy) blocksBin: newBlocksBin.
	newCopy objName: self nextInstanceName.
	newCopy setMedia: (media collect: [:el | el copy]).
	newCopy lookLike: costume mediaName.
	^ newCopy
