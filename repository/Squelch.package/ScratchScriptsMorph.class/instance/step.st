stepping
step
	"Give feedback about possible drop targets."

	| feedbackColor h b targetArg targetAssoc targetP targetBlock |

	feedbackMorph
		ifNil: [feedbackMorph := BorderedMorph new borderWidth: 3]  "create feedback morph if necessary"
		ifNotNil: [feedbackMorph delete].  "remove old feedback"
	feedbackColor := Color white.
	feedbackMorph useSquareCorners.

	h := World activeHand.
	h toolType = 'CutTool' ifTrue: [^ self showDeleteFeedback].

	(self bounds containsPoint: h position) ifFalse: [^ self].
	h submorphCount = 1 ifFalse: [^ self].
	b := h firstSubmorph.
	(b isKindOf: ScratchCommentMorph) ifTrue: [^ self showCommentDropFeedback].
	(b isKindOf: BlockMorph) ifFalse: [^ self].

"attempt at auto-scrolling (has some issues, commented out for now):

	((self owner bounds containsPoint: h position) and:
		[(h position x - self owner left) < 50 or: [
			(self owner right - h position x) < 50 or: [
				(self owner bottom - h position y) < 50 or: [
					(h position y - self owner top) < 50]]]])
		ifTrue:[self owner scrollMorphIntoView: h firstSubmorph].
xxxxxxxx"

	b isReporter ifTrue: [ "reporter block"
		(targetArg := self topArgMorphAt: b bounds exclude: nil) ifNil: [^ self].
		(targetArg acceptsTypeOf: b) ifFalse: [^ self].
		feedbackMorph
			bounds: (targetArg bounds expandBy: 5);
			color: (feedbackColor alpha: 0.4);
			borderColor: feedbackColor;
			useRoundedCorners.
		^ self addMorphFront: feedbackMorph].

	"non-reporter (i.e. command block or hat block)"
	targetAssoc := b closestAttachTargetIn: self.
	targetAssoc ifNil: [
		(b bottomBlock isKindOf: CBlockMorph) ifFalse: [
			targetAssoc := b bottomBlock closestAttachTargetIn: self.
			targetAssoc ifNotNil:[
				(targetAssoc value owner isKindOf: BlockMorph) ifTrue:[
					targetAssoc := nil]]]].
	targetAssoc ifNil: [^ self].

	targetP := targetAssoc key.
	targetBlock := targetAssoc value.
	feedbackMorph borderColor: feedbackColor; color: feedbackColor.

	"subtract the attachment point x from the width so that the feedback in CBlock won't stick out"
	ScratchTranslator isRTL
		ifTrue: [feedbackMorph extent: (targetP x - targetBlock left)@5.
			self addMorphFront: (feedbackMorph position: targetP - (feedbackMorph width@0))]
		ifFalse: [feedbackMorph extent: (targetBlock right - targetP x)@5.
			self addMorphFront: (feedbackMorph position: targetP)].
