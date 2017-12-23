event handling
mouseDown: evt
	"Handle a mouse click. Left click either sets me as a target, deletes me, or copies me.  Shift left click makes me reappear in the middle of the screen.  Holding left button drags me. Right button brings up a menu."

	| duplicate frame |

	(evt hand toolType = 'CutTool') & (evt yellowButtonPressed not) ifTrue: [
		evt shiftPressed ifFalse: [evt hand toolType: nil].
		(target notNil and:
		 [(target isKindOf: ScratchStageMorph) not]) ifTrue: [
			self target undoableDeleteSprite].
		^ self].
	
	(evt hand toolType = 'CopyTool') & (evt yellowButtonPressed not) ifTrue: [
		evt shiftPressed ifFalse: [evt hand toolType: nil].
		(target notNil and:
		 [(target isKindOf: ScratchStageMorph) not]) ifTrue: [
			duplicate := self target duplicate.
			self world activeHand
				attachMorph: duplicate;
				formerOwner: self target owner position: self target owner center].
		^ self].

	target ifNotNil: [
		evt shiftPressed ifTrue: [self select. ^ self target makeVisible].
		evt yellowButtonPressed
			ifTrue: [
				Sensor waitNoButton. 
				(target isKindOf: ScratchStageMorph) 
					ifFalse: [^ self rightButtonMenu]]
			ifFalse:	[
				self select.
				frame := self meOrOwnerThatIsA: ScratchFrameMorph.
				"Set the viewerPane target to my target so I stay highlighted while I am being dragged. This is sort of a hack because my target is not actually being viewed until the mouseUp: command is called."
				frame viewerPane target: self target.
				evt hand waitForClicksOrDrag: self event: evt]].
