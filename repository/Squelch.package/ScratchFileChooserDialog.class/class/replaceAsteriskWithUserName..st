utilities
replaceAsteriskWithUserName: aString
	"If the given string includes an asterisk, replace it with the name of the current user. Otherwise, return the string."
	"self replaceAsteriskWithUserName: '/Users/*/Documents'"

	| i home delimiter userName |
	(i := aString indexOf: $*) = 0 ifTrue: [^ aString].
	home := ScratchPlugin primGetFolderPathOrNil: 1.
	home ifNil: [^ aString].
	delimiter := FileDirectory pathNameDelimiter asString.
	userName := (home findTokens: delimiter) last.
	^ (aString copyFrom: 1 to: i - 1), userName, (aString copyFrom: i + 1 to: aString size).
