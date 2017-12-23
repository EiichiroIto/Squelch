dropping/grabbing
attachTargetIn: newOwner
	"Answer a CommandBlockMorph that is overlapped by the receiver, nil if none."

	| candidates target overlap ratio |

	(newOwner isKindOf: ScratchScriptsMorph) ifFalse: [^ nil].

	candidates := newOwner allMorphs select: [:each |
		(each isKindOf: BlockMorph) and:
		[each isReporter not and:
		[each hasComment not and:
		[self bounds intersects: each bounds]]]].

	candidates isEmpty ifTrue: [^ nil].

	target := candidates first.
	ratio := (self bounds intersect: target bounds) area / target bounds area.
	candidates do: [:each |
		overlap := ((self bounds intersect: each bounds) area / (each bounds area)).
		overlap > ratio ifTrue: [
			ratio := overlap.
			target := each]].

	^ target
