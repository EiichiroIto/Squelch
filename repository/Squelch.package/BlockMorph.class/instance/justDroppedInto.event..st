dropping/grabbing
justDroppedInto: newOwner event: evt
	"Handle being dropped into a new situation."

	| frame targetAssoc targetP targetBlock bottomBlockUsed upperBlock |
Transcript cr; show: 'self='; show: self.
Transcript cr; show: 'justDroppedInto: '; show: newOwner ; show: 'event: '; show: evt.
	bottomBlockUsed := false.

	(frame := newOwner meOrOwnerThatIsA: ScratchFrameMorph)
		ifNotNil: [frame projectModified].

	((self meOrOwnerThatIsA: ScratchViewerMorph) notNil) ifTrue: [
		"delete myself when dropped in the blocks palette area"
		self delete.
		self receiver blocksBin changed.
		^ self].

	"blocks cannot be dropped onto the stage"
	(owner isKindOf: ScratchStageMorph) ifTrue: [
		^ self rejectDropEvent: evt].

	"okay to drop blocks into the world during development"
	"((owner == World) and: [Preferences noviceMode not]) ifTrue: [^ self]."

	((owner isKindOf: ScratchScriptsMorph) or:
	 [(owner isKindOf: BlockMorph) or:
	 [(owner isKindOf: ScratchStageMorph) and: [self isReporter]]]) ifFalse: [
		^ self rejectDropEvent: evt].

	self isReporter ifTrue: [^ self handleReporterDrop].

	targetAssoc := self closestAttachTargetIn: newOwner.
	targetAssoc ifNil: [
		(self bottomBlock isKindOf: CBlockMorph) ifFalse: [
			targetAssoc := self bottomBlock closestAttachTargetIn: newOwner.
			targetAssoc ifNotNil:[
				bottomBlockUsed := true.
				(targetAssoc value owner isKindOf: BlockMorph) ifTrue:[
					targetAssoc := nil]]]].
	targetAssoc ifNil: [^ self].

	"make sure no processes are running"
	self = self topBlock ifTrue: [self stop].

	targetP := targetAssoc key.
	targetBlock := targetAssoc value.

	targetP y = targetBlock top
		ifTrue: [
			"c-shaped block should nest the target block"
			"((bottomBlockUsed not) and: [((targetBlock owner isKindOf: BlockMorph) not) and: [(self isKindOf: CBlockMorph)]]) ifTrue:["
			((bottomBlockUsed not) and: [(self isKindOf: CBlockMorph)]) ifTrue:[
				(targetBlock owner isKindOf: BlockMorph)
					ifTrue: [(targetBlock owner) attachBlock: self]
					ifFalse: [self position: (targetP x - self bracketThickness)@(targetP y - self topBarHeight - 3)].
				self attachBlockNested: targetBlock. ^ self].
			"for all other non-c-shaped blocks"
			(bottomBlockUsed or:[((targetBlock owner isKindOf: BlockMorph) not) and: [(self isKindOf: CBlockMorph) not]]) ifTrue:[
				ScratchTranslator isRTL
					ifTrue: [self bottomBlock position: (targetP x - self bottomBlock width) @ (targetP y - (self bottomBlock height - 4))]
					ifFalse: [self bottomBlock position: targetP x @ (targetP y - (self bottomBlock height - 4))].
				upperBlock := self bottomBlock owner.
				[upperBlock isKindOf: BlockMorph] whileTrue: [
					upperBlock nextBlock ifNotNil:[
						ScratchTranslator isRTL
							ifTrue: [upperBlock position: (targetP x - upperBlock width) @ (upperBlock nextBlock position y - (upperBlock height - 4))]
							ifFalse: [upperBlock position: targetP x @ (upperBlock nextBlock position y - (upperBlock height - 4))].
						upperBlock := upperBlock owner]]].
			((bottomBlockUsed not) and: [targetBlock owner isKindOf: BlockMorph]) ifTrue:[
				ScratchTranslator isRTL
					ifTrue: [self position: (targetP x - self width) @ (targetP y - (self height - 4))]
					ifFalse: [self position: targetP x @ (targetP y - (self height - 4))]].
			(targetBlock owner isKindOf: BlockMorph) ifTrue:[
				ScratchTranslator isRTL
					ifTrue: [self topBlock position: (targetP x - self topBlock width) @ targetP y]
					ifFalse: [self topBlock position: targetP x @ targetP y].
				targetBlock owner attachBlock: self topBlock].
			ScratchTranslator isRTL
				ifTrue: [targetBlock position: (targetP x - targetBlock width) @ (self bottomBlock position y + self bottomBlock height + 4)]
				ifFalse: [targetBlock position: targetP x @ (self bottomBlock position y + self bottomBlock height + 4)].
			((bottomBlockUsed not) and: [((targetBlock owner isKindOf: BlockMorph) not) and: [(self isKindOf: CBlockMorph)]]) ifFalse:[
				self bottomBlock attachBlock: targetBlock]]
		ifFalse: [
			self assert: [(self isKindOf: HatBlockMorph) not].  "I am not a HatBlockMorph"
			ScratchTranslator isRTL
				ifTrue: [self position: (targetP - (self width @0))]
				ifFalse: [self position: targetP].
			targetBlock attachBlock: self].
