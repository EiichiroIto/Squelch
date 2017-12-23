private
acceptEdits
	"Tell the client to accept edits."

	(target notNil & putSelector notNil) ifFalse: [^ self].
	[target perform: putSelector with: self contents] ifError: [].

