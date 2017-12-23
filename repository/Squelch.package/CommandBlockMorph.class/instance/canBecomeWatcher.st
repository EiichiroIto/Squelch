private
canBecomeWatcher
	"I determine which blocks can become watchers."

	| i |
	i := selector asString findAnySubStr: #('mouse' 'key' 'touching' 'distance') startingAt: 1.
	^ (self isReporter) &
	   (self argumentCount <= 1) &
	   ((#(not atRandom abs rounded lineCountOfList: stringLength:) includes: selector) not) &
	   (i > selector asString size)
