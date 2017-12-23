private
updateSliderPosition
	"Set my slider position to the variable's current value"

	| watcher val |
	self target ifNil: [^ self].
	(watcher := self meOrOwnerThatIsA: WatcherMorph) ifNil: [^ self].

	val := self target getVar: watcher getVariable.
	val ifNil: [^ self].  "can happen when variable has been deleted"
	val := val asNumberNoError.
	self adjustToValue: (val min: maxVal max: minVal).
