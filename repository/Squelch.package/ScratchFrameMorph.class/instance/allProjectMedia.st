menu/button actions
allProjectMedia
	"Answer a collection of all media items in the current project."

	| result |
	result := OrderedCollection new.
	(workPane submorphs copyWith: workPane) do: [:m |
		(m isKindOf: ScriptableScratchMorph) ifTrue: [
			result addAll: m media]].
	^ result
