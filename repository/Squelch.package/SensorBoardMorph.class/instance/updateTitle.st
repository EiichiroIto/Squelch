private
updateTitle
	"Update my title to reflect the current protocol and port number."

	| s |
	s := (#on = scanState) ifTrue: ['On' localized] ifFalse: ['Off' localized].
	s = titleMorph contents ifFalse: [titleMorph contents: s].

