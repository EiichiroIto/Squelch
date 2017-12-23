private
updateSliderPosition
	"Set my slider position to the variable's current value"

	| value |
	self target ifNil: [^ self].
	value := self target perform: #setVar:to: with: variable.
	value ifNil: [^ self].  "can happen when variable has been deleted"
	slider adjustToValue: value.
