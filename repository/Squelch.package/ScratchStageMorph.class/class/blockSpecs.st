block specs
blockSpecs

	| blocks |
	blocks := #(
		'sensing'
			('ask %s and wait'			s	doAsk 'What''s your name?')
			('answer'					r	answer)
			-
			('mouse x'					r	mouseX)
			('mouse y'					r	mouseY)
			('mouse down?'				b	mousePressed)
			-
			('key %k pressed?'			b	keyPressed: 'space')
			-
			('reset timer'				-	timerReset)
			('timer'						r	timer)
			-
			('%a of %m'					r	getAttribute:of:)
			-
			('loudness'					r	soundLevel)
			('loud?'						b	isLoud)
			~
			('%H sensor value'			r	sensor: 'slider')
			('sensor %h?'				b	sensorPressed: 'button pressed')
		'looks'
			('switch to background %l'	-	showBackground: 'background1')
			('next background'			-	nextBackground)
			('background #'				r	backgroundIndex)
			-
			('change %g effect by %n'	-	changeGraphicEffect:by: 'color' 25)
			('set %g effect to %n'		-	setGraphicEffect:to: 'color' 0)
			('clear graphic effects'		-	filterReset)
			-
"xxx			('place sprites for scene %x'	-	showScene:) "
		'pen'
			('clear'						-	clearPenTrails)
	).

	^ blocks, super blockSpecs
