variables
deleteVariable
	"Ask the user which user variable to delete, then remove it."

	| sFrame stage menu choice |
	sFrame := self meOrOwnerThatIsA: ScratchFrameMorph.
	sFrame ifNil: [^ self].

	stage := sFrame workPane.
	(stage varNames isEmpty) & (self varNames isEmpty)
		ifTrue: [^ self inform: 'No variables.' localized].

	menu := MenuMorph new.
	menu target: [ :v | choice := v ].
	stage varNames do: [:v | menu add: v selector: #value: argument: (Array with: v with: #global)].
	self = stage ifFalse: [
		stage varNames isEmpty ifFalse: [menu addLine].
		self varNames do: [:v | menu add: v selector: #value: argument: (Array with: v with: #local)]].
	menu invokeAt: ActiveHand position in: self world.
	choice ifNil: [^ self].

	choice second = #global
		ifTrue: [stage deleteVariable: choice first]
		ifFalse: [self deleteVariable: choice first].

	sFrame viewerPane categoryChanged: 'variables'.
