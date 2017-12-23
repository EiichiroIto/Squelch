watchers
initializeWatcherPositions
	"If any watchers are on the stage, store their position. The dictionary, which is created lazily, is formatted in the following way:
	(<sprite or nil, depending on whether the block isSpriteSpecific>, <name of block>) ->
		(<watcher or nil, depending on whether the watcher is showing on stage>,
		 <position of watcher with top-left corner of stage = 0@0>
		 <layout style>
		 <slider range>)
	Or, more concisely: (sprite/nil,selectorAndArg)->(watcher/nil,position,style,range)."
 
	| p |
	watcherPositions := Dictionary new.
	self scratchWatchers do: [:w |
		p := w position - workPane position.
		watcherPositions
			at: {w getAssociatedSprite. w selectorAndArg}
			put: {w. p. w layoutStyle. w sliderRange}].
