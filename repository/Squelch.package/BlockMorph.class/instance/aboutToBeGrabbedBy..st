dropping/grabbing
aboutToBeGrabbedBy: aHandMorph
	"If I'm being used as an argument, replace myself with an appropriate argument morph. Copied from WatcherMorph."

	| m |
	(owner isKindOf: CommandBlockMorph) | (owner isKindOf: WhenHatBlockMorph) ifTrue: [
		"if I was being used as argument, replace myself with a generic argument morph"
		m := owner argMorphToReplace: self.
		m ifNotNil: [owner replaceArgMorph: self by: m]].
