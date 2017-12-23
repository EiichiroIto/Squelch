menu/button actions
uniqueSummaryFileName

	| baseName fileName n |
	baseName := self projectName.
	baseName size <= 1 ifTrue: [baseName := 'newProject'].
	fileName := baseName, '-summary.txt'.
	n := 1.

	[(FileSystem workingDirectory / fileName) isFile] whileTrue: [
		fileName := baseName, n printString, '-summary.txt'.
		n := n + 1].

	^ fileName

