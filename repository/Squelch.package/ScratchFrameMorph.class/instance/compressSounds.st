menu/button actions
compressSounds

	| menu bitsPerSample count |
	menu := MenuMorph new addTitle: 'Sound quality:'.
	menu target: [ :v | bitsPerSample := v ].
	menu add: 'High (biggest)' selector: #value: argument: 5.
	menu add: 'Normal' selector: #value: argument: 4.
	menu add: 'Low' selector: #value: argument: 3.
	menu add: 'Lowest (smallest)' selector: #value: argument: 2.
	menu addLine.
	menu add: 'cancel' selector: #value: argument: nil.
	menu localize.
	menu invokeAt: ActiveHand position in: self world.
	bitsPerSample ifNil: [^ self].

	count := self canonicalizeSoundsBits: bitsPerSample saveOriginal: false.
	scriptsPane categoryChanged: 'Sounds'.
	DialogBoxMorph inform: 'Sounds compressed' withDetails: count printString.
