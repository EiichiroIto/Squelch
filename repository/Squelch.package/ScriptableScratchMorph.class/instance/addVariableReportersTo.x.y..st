blocks
addVariableReportersTo: page x: x y: startY
	"Add the list block reporters to the given page starting at the given y offset. Answer the new y."

	| y stage b watcherButton yOffset line line2 |
	y := startY.

	stage := self meOrOwnerThatIsA: ScratchStageMorph.
	(stage notNil and: [stage ~= self]) ifTrue: [
		stage varNames do: [:vName |
			b := VariableBlockMorph new
				commandSpec: vName;
				receiver: stage blockReceiver.

			watcherButton := self createToggleButtonFor: b.
			yOffset := (b fullBounds height - watcherButton height) // 2.
			page addMorph: (watcherButton position: x @ (y + yOffset)).
			page addMorph: (b position: (x + watcherButton width + 4)@y).
			y := y + b height + 3].
		(self varNames size > 0) ifTrue: [
			line := Morph new.
			line
				extent: 90@1;
				color: Color gray darker darker;
				position: x@(y+2).
			line2 := Morph new.
			line2
				extent: 90@1;
				color: Color gray lighter;
				position: x@(y+3).
			page
				addMorph: line;
				addMorph: line2.
			y := y + 9]].

	self varNames do: [:vName |
		b := VariableBlockMorph new
			commandSpec: vName;
			receiver: self blockReceiver.

		watcherButton := self createToggleButtonFor: b.
		yOffset := (b fullBounds height - watcherButton height) // 2.
		page addMorph: (watcherButton position: x @ (y + yOffset)).
		page addMorph: (b position: (x + watcherButton width + 4)@y).
		y := y + b height + 3].

	^ y
