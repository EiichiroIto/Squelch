other
argMorphToReplace: aMorph
	"Answer a new argument morph to be used to replace the given morph."

	aMorph ~= argMorph ifTrue: [^ nil].
	^ BooleanArgMorph new
