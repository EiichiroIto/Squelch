debug and other
buildDebugMenu: aHand
	"Answer a debugging menu for the receiver. 
	 The hand argument is seemingly historical and plays no role presently"

	| aMenu |
	aMenu := UIManager default newMenuIn: self for: self.
	aMenu addStayUpItem.
	(self hasProperty: #errorOnDraw) ifTrue:
		[aMenu add: 'start drawing again' selector: #resumeAfterDrawError.].
	(self hasProperty: #drawError) ifTrue:
		[aMenu add: 'debug drawing error' selector: #debugDrawError.
		aMenu addLine].
	(self hasProperty: #errorOnStep) ifTrue:
		[aMenu add: 'start stepping again' selector: #resumeAfterStepError.
		aMenu addLine].

	aMenu add: 'inspect morph' selector: #inspectInMorphic:.
	aMenu lastItem icon: Smalltalk ui icons smallInspectItIcon.
	aMenu add: 'inspect owner chain' selector: #inspectOwnerChain.
	aMenu lastItem icon: Smalltalk ui icons smallInspectItIcon.
	self isMorphicModel ifTrue: [
		aMenu add: 'inspect model' target: self model selector: #inspect.
		aMenu lastItem icon: Smalltalk ui icons smallInspectItIcon ].
     aMenu add: 'explore morph' target: self selector: #explore.
	aMenu lastItem icon: Smalltalk ui icons smallInspectItIcon.
	aMenu addLine.
	aMenu add: 'browse morph class' target: self selector: #browseHierarchy.
	(self isMorphicModel)
		ifTrue: [aMenu
				add: 'browse model class'
				target: self model
				selector: #browseHierarchy].
	^ aMenu