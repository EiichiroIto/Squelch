Unicode rendering
renderHintString
	"Answer a string to be used as an example button lable to adjust button size and label centering."
	"self renderHintString"
	"self showHintString"

	| result srcs |
	result := RenderHintString.
	result ifNil: [
		result := ''.
		srcs := #('New' 'Open' 'Save' 'Save As' 'Share!' 'Undo' 'Language' 'Extras' 'Want Help?' 'motion' 'looks' 'sound' 'pen' 'control' 'sensing' 'operators' 'variables').
		srcs do: [: s |
			result := result, (self translationFor: s)]].

	"RenderWithSqueak ifTrue: [result := String withAll: result]."

	^ result
