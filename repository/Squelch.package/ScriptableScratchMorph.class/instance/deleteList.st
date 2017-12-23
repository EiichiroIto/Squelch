list ops
deleteList
	"Ask the user which list variable to delete, then remove it."

	| sFrame stage menu choice |
	sFrame := self meOrOwnerThatIsA: ScratchFrameMorph.
	sFrame ifNil: [^ self].

	stage := sFrame workPane.
	(stage listVarNames isEmpty) & (self listVarNames isEmpty)
		ifTrue: [^ self inform: 'No lists.' localized].

	menu := MenuMorph new.
	menu target: [ :v | choice := v ].
	stage listVarNames do: [:v | menu add: v selector: #value: argument: (Array with: v with: #global)].
	self = stage ifFalse: [
		stage listVarNames isEmpty ifFalse: [menu addLine].
		self listVarNames do: [:v | menu add: v selector: #value: argument: (Array with: v with: #local)]].
	menu invokeAt: ActiveHand position in: self world.
	choice ifNil: [^ self].

	choice second = #global
		ifTrue: [stage deleteList: choice first]
		ifFalse: [self deleteList: choice first].

	sFrame viewerPane categoryChanged: 'variables'.
