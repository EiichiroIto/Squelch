block specs
blockSpecs

	| blocks |
	blocks := #(
		'motion'
			('move %n steps'				-	forward:)
			('turn %n degrees'				-	turnRight: 15)	"icon shows turn direction"
			('turn %n degrees'				-	turnLeft: 15)	"icon shows turn direction"
			-
			('point in direction %d'			-	heading: 90)
			('point towards %m'				-	pointTowards:)
			-
			('go to x:%n y:%n'				-	gotoX:y: 0 0)
			('go to %m'						-	gotoSpriteOrMouse:)
			('glide %n secs to x:%n y:%n'	t	glideSecs:toX:y:elapsed:from: 1 50 50)
			-
			('change x by %n'				-	changeXposBy: 10)
			('set x to %n'					-	xpos: 0)
			('change y by %n'				-	changeYposBy: 10)
			('set y to %n'					-	ypos: 0)
			-
			('if on edge, bounce'			-	bounceOffEdge)
			-
			('x position'						r	xpos)
			('y position'						r	ypos)
			('direction'						r	heading)
		'pen'
			('clear'							-	clearPenTrails)
			-
			('pen down'						-	putPenDown)
			('pen up'						-	putPenUp)
			-
			('set pen color to %c'			-	penColor:)
			('change pen color by %n'		-	changePenHueBy:)
			('set pen color to %n'			-	setPenHueTo: 0)
			-
			('change pen shade by %n'		-	changePenShadeBy:)
			('set pen shade to %n'			-	setPenShadeTo: 50)
			-
			('change pen size by %n'		-	changePenSizeBy: 1)
			('set pen size to %n'				-	penSize: 1)
			-
			('stamp'							-	stampCostume)
	).

	blocks := blocks, #(
		'looks'
			('switch to costume %l'			-	lookLike:)
			('next costume'					-	nextCostume)
			('costume #'						r	costumeIndex)
			-
			('say %s for %n secs'			t	say:duration:elapsed:from: 'Hello!' 2)
			('say %s'						-	say: 'Hello!')
			('think %s for %n secs'			t	think:duration:elapsed:from: 'Hmm...' 2)
			('think %s'						-	think: 'Hmm...')
			-
			('change %g effect by %n'		-	changeGraphicEffect:by: 'color' 25)
			('set %g effect to %n'			-	setGraphicEffect:to: 'color' 0)
			('clear graphic effects'			-	filterReset)
			-
			('change size by %n'			-	changeSizeBy:)
			('set size to %n%'				-	setSizeTo: 100)
			('size'							r	scale)
			-
			('show'							-	show)
			('hide'							-	hide)
			-
			('go to front'					-	comeToFront)
			('go back %n layers'			-	goBackByLayers: 1)
		'sensing'
			('touching %m?' 				b	touching:)
			('touching color %C?' 			b	touchingColor:)
			('color %C is touching %C?'		b	color:sees:)
			-
			('ask %s and wait'				s	doAsk 'What''s your name?')
			('answer'						r	answer)
			-
			('mouse x'						r	mouseX)
			('mouse y'						r	mouseY)
			('mouse down?'					b	mousePressed)
			-
			('key %k pressed?'				b	keyPressed: 'space')
			-
			('distance to %m'				r	distanceTo:)
			-
			('reset timer'					-	timerReset)
			('timer'							r	timer)
			-
			('%a of %m'						r	getAttribute:of:)
			-
			('loudness'						r	soundLevel)
			('loud?'							b	isLoud)
			~
			('%H sensor value'				r	sensor: 'slider')
			('sensor %h?'					b	sensorPressed: 'button pressed')
		).

	^ blocks, super blockSpecs
