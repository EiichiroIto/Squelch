watchers
watcherShowingFor: sprite selectorAndArg: selectorAndArg
	"Answer true if a watcher for the given sprite, selector, and argument is currently showing on the stage."

	| sel arg listM pair |
	sel := selectorAndArg first.
	arg := selectorAndArg second.
	#contentsOfList: = sel ifTrue: [
		listM := sprite lists at: arg ifAbsent: [^ false].
		^ listM owner notNil].

	pair := watcherPositions at: {sprite. selectorAndArg} ifAbsent: [^ false].
	pair first ifNotNil: [
		pair first owner ifNil: [pair at: 1 put: nil]].
	^ pair first notNil
