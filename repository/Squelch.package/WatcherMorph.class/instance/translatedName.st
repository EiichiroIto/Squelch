private
translatedName
	"Answer the name for this watcher based on my selector and argument. The names of reporters are translated into the current language. The names of variables are left untouched."

	| sel spec result param |
	readout target ifNil: [^ 'xxx'].
	sel := readout getSelector.
	#getVar: = sel ifTrue: [^ readout parameter].

	spec := readout target blockSpecForSelector: sel.
	spec ifNil: [^ sel].

	result := ScratchTranslator translationFor: spec.
	param := readout parameter.
	param ifNil: [param := ''].

	#sensor: = sel ifTrue: [
		result := self replace: '%H' with: (ScratchTranslator translationFor: param) in: result].
	#sensorPressed: = sel ifTrue: [
		result := self replace: '%h' with: (ScratchTranslator translationFor: param) in: result].

	^ result
