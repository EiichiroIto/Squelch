sound ops
midiNoteMenu
	"Provides a drop-down menu for setting the note number."

	| menu midiKey noteName |
	menu := CustomMenu new.
	midiKey := 48.
	#(low middle) do: [:oct |
		#(C 'C#' D 'Eb' E F 'F#' G 'Ab' A 'Bb' B) do: [:n |
			n = #C
				ifTrue: [noteName := oct, ' ', n]
				ifFalse: [noteName := n].
			menu
				add: '(', midiKey printString, ') ', noteName
				action: midiKey.
			midiKey := midiKey + 1]].
		menu add: '(72) high C' action: 72.
	^ menu
