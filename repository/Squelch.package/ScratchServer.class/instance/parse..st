private-command parsing
parse: aString
	"ScratchServer new parse: 'test abc 1 -1 .01 -.01 true false'"

	| out token |
	in := ReadStream on: aString asString.
	out := OrderedCollection new.
	[in atEnd] whileFalse: [
		token := self readNext.
		token ifNotNil: [out addLast: token]].
	^ out asArray
