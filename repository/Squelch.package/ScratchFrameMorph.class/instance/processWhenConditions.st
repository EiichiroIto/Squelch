stepping
processWhenConditions
	"Trigger any 'when <condition>' hats."

	| objList |
	true ifTrue: [^ self].  "disabled"
	objList := workPane submorphs select: [:m | m isKindOf: ScriptableScratchMorph].
	objList := objList copyWith: workPane.
	objList do: [:obj |
		obj scripts do: [:hat |
			(hat isMemberOf: WhenHatBlockMorph) ifTrue: [
				(hat hasRunningProcess not and: [hat evaluateCondition]) ifTrue: [
					hat start; layoutChanged]]]].
