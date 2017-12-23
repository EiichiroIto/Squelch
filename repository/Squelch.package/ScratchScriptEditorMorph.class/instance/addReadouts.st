private
addReadouts
	"Add readouts for my target's position and direction."

	| x y label readout s |
	self deleteReadouts.
	readoutMorphs := OrderedCollection new.

	x := nameMorph left.
	y := nameMorph bottom + 5.

	#(('x' xpos) ('y' ypos)('direction' heading)) do: [:spec |

		(ScratchTranslator isRTL and: [(spec at: 1) = 'x' or: [(spec at: 1) = 'y']])
			ifTrue: [s := (':', spec first)]
			ifFalse: [s := (spec first localized, ScratchTranslator colonSuffix)].

		label := StringMorph new
			contents: s;
			font: (ScratchFrameMorph getFont: #XYReadout);
			position: x@y.

		readout := (UpdatingStringMorph on: self target selector: spec second)
			font: (ScratchFrameMorph getFont: #XYReadoutBold);
			forceUnicodeRendering: true;
			color: (Color gray: 0.2);
			contents: '-000';  "this sets the readout size"
			growable: false;
			stepTime: 100;
			position: (label right + 4)@y.

		ScratchTranslator isRTL ifTrue:[
			readout rightJustify: true].

		self addMorph: label; addMorph: readout.
		readoutMorphs add: label; add: readout.

		readout startStepping.
		x := readout right + 2].

	ScratchTranslator isRTL ifTrue: [
		readoutMorphs reversed do: [: m |
			readoutMorphs remove: m.
			readoutMorphs add: m]].

	penReadout := Morph new extent: 15@5.
	penReadout position: (lockButton right + 4)@(nameMorph top + ((nameMorph height - penReadout height) / 2));
		color: Color transparent.
	self addMorph: penReadout.
	readoutMorphs add: penReadout.
	penReadout startStepping.

	readoutMorphs := readoutMorphs asArray.
