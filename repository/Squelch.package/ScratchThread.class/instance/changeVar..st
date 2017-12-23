var cmds
changeVar: anArray
	"Read a variable and return its value."
	"Format of anArray is: (#changeVariable <varName> <setOrChangeSelector> <arg>)"

	| arg |
	arg := self evalArg: (anArray at: 4).
	#setVar:to: = (anArray at: 3)
		ifTrue: [sprite setVar: (anArray at: 2) to: arg]
		ifFalse: [sprite changeVar: (anArray at: 2) by: arg].
