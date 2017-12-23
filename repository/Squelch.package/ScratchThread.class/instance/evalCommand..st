private
evalCommand: anArray
	"Evaluate the given command and return it's value."

	| selector args |
	selector := anArray first asSymbol.

	selector = #readVariable ifTrue: [^ self readVar: anArray].
	selector = #changeVariable ifTrue: [^ self changeVar: anArray].

	(SystemCommands includes: selector) ifTrue: [
		^ self perform: selector].

	args := (2 to: anArray size) collect: [:i | self evalArg: (anArray at: i)].

	(args size = 1 and: [#(abs not sqrt) includes: selector]) ifTrue: [
		^ (args at: 1) perform: selector].
		
	(args size = 2 and: [selector isInfix]) ifTrue: [  "binary math/logic ops"
		^ (args at: 1) perform: selector with: (args at: 2)].

	sprite perform: selector withArguments: args.
