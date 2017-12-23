private
presentHelpScreen
	"Answer the name of the help screen for this block, or nil if no help is available."

	| fr |
	fr := self meOrOwnerThatIsA: ScratchFrameMorph.
	fr
		ifNil: [^ nil]
		ifNotNil: [fr presentHelpScreen: self helpScreenName].
