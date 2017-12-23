variables
addGlobalVariable
	"Ask the user for a variable name, then add a background (global) variable of that name."

	| sFrame varName |
	(sFrame := self meOrOwnerThatIsA: ScratchFrameMorph) ifNil: [^ self beep].

	varName := StringDialog ask: 'Variable name?'.
	varName size = 0 ifTrue: [^ self].
	varName := varName.
	(sFrame workPane variableNameInUse: varName) ifTrue: [
		self beep.
		DialogBoxMorph warn: 'That variable name is already in use'.
		^ self].

	sFrame workPane addVariable: varName.
	sFrame viewerPane categoryChanged: 'variables'.
	self addWatcherForNewVariable: varName withScope: sFrame workPane.
