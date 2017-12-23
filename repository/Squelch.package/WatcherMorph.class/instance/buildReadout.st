initialization
buildReadout
	"Build my readout component morphs."

	readout := UpdatingStringMorphWithParameter new
		contents: '';
		floatPrecision: 0.1;
		stepTime: 100.
	readout
		useStringFormat;
		font: (ScratchFrameMorph getFont: #Watcher);
		forceUnicodeRendering: true;
		color: Color white";
		kern: 1".
	readoutFrame := WatcherReadoutFrameMorph new addMorph: readout.
