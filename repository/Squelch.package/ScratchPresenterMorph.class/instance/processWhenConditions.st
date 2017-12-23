event handling
processWhenConditions
	"Trigger any 'when <condition>' hats."

	| objList |
	true ifTrue: [^ self].  "disabled"
	objList := stage submorphs select: [:m | m isKindOf: ScriptableScratchMorph].
	objList := objList copyWith: stage.
	objList do: [:obj |
		obj scripts do: [:hat |
			(hat isMemberOf: WhenHatBlockMorph) ifTrue: [
				(hat hasRunningProcess not and: [hat evaluateCondition]) ifTrue: [
					hat start; layoutChanged]]]].
