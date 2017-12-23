menus
rightButtonMenu

	| menu sFrame choice spec |
	menu := MenuMorph new.
	menu target: [ :v | choice := v ].
	menu add: 'help' selector: #value: argument: #presentHelpScreen.

	(owner isKindOf: ScratchBlockPaletteMorph) ifFalse: [
		menu addLine.
		(#(+ - * / \\) includes: selector) ifTrue: [
			#(+ - * / mod) with: #(+ - * / \\) do: [:s :op | menu add: s selector: #value: argument: op]].
		(#(< = >) includes: selector) ifTrue: [
			#(< = >) do: [:op | menu add: op selector: #value: argument: op]].
		(#(& |) includes: selector) ifTrue: [
			#(and or) with: #(& |) do: [:s :op | menu add: s selector: #value: argument: op]].

		menu addLine.
		menu add: 'duplicate' selector: #value: argument: #duplicate.
		(self owner isKindOf: BlockMorph) ifFalse: [  "can't yet delete a blocks inside a script"
			menu add: 'delete' selector: #value: argument: #delete]].

	sFrame := self meOrOwnerThatIsA: ScratchFrameMorph.
	(sFrame notNil and: [#(sensor: sensorPressed:) includes: selector]) ifTrue: [
		menu addLine.
		menu add: 'show ScratchBoard watcher' selector: #value: argument: #showSensorBoard.
		sFrame workPane scratchServer
			ifNil: [menu add: 'enable remote sensor connections' selector: #value: argument: #enableRemoteSensors]
			ifNotNil: [menu add: 'disable remote sensor connections' selector: #value: argument: #exitScratchSession]].

	DebugMenu ifTrue: [
		menu addLine.
		menu add: 'show tuples' selector: #value: argument: #showTuples].

	menu localize.
	menu invokeAt: ActiveHand position in: self world.
	
	choice ifNil: [^ self].
	(#(presentHelpScreen duplicate delete) includes: choice) ifTrue: [^ self perform: choice].
	choice = #showSensorBoard ifTrue: [sFrame showSensorBoard. ^ self].
	choice = #enableRemoteSensors ifTrue: [sFrame enableRemoteSensors. ^ self].
	choice = #exitScratchSession ifTrue: [sFrame exitScratchSession. ^ self].
	choice = #showTuples ifTrue: [^ self showTuples].

	"change operator"
	spec := '%n ', choice, ' %n'.
	'\\' = choice	ifTrue: [spec := ScratchTranslator translationFor: '%n mod %n'].
	'&' = choice	ifTrue: [spec := ScratchTranslator translationFor: '%b and %b'].
	'|' = choice	ifTrue: [spec := ScratchTranslator translationFor: '%b or %b'].

	self commandSpec: spec.
	self selector: choice.
