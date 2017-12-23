drawing
updateStageDisplay
	"Redraw the damaged areas of this stage directly onto the display. Assumes that no other morph is in front of me."

	| root damageList |
	root := owner.
	[root owner notNil] whileTrue: [root := root owner].
	(root respondsTo: #damageRecorder) ifFalse: [^ self].

	damageList := root damageRecorder filteredDamageWithin: self bounds.
	damageList size > 0 ifTrue: [self incrRedraw: damageList].
