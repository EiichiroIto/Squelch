other
triggered
	"Answer true if my condition has just become true."

	| condition |
	condition := self evaluateCondition.
	condition & lastState not ifTrue: [lastState := true. ^ true].  "trigger on false->true transition"
	lastState := condition.
	^ false
