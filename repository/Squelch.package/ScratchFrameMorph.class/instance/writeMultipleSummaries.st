menu/button actions
writeMultipleSummaries
	"Write the summary for all Scratch projects in a given folder."

	| dir |
	dir := ScratchFileChooserDialog chooseFolder: FileSystem workingDirectory.
	dir = #cancelled ifTrue: [^ self].

	dir allFiles do: [:fr | | fn |
		fn := fr pathString.
		(fn asLowercase endsWith: '.scratch') | (fn asLowercase endsWith: '.sb') ifTrue: [
			self openScratchProjectNamed: fn.
			World doOneCycleNoInput.
			self writeSummaryFile: fn]].
