block specs
blockSpecs
	"Answer a collection of block specifications for the blocks that are common to all objects. Block specificatons (Arrays) are interspersed with category names (Strings). A block specification is an Array of the form: (<block spec string> <block type> <selector> [optional initial argument values]).

	Explanation of flags:
		-	no flags
		b	boolean reporter
		c	c-shaped block containing a sequence of commands (always special form)
		r	reporter
		s	special form command with its own evaluation rule
		t	timed command, like wait or glide
		E	message event hat
		K	key event hat
		M	mouse-click event hat
		S	start event hat
		W	when <condition> hat (obsolete)"

	| blocks |
	blocks := #(
		'control'
			('when %m clicked'				S	-)
			('when %k key pressed'			K	-)
			('when %m clicked'				M	-)
			-
			('wait %n secs'					t	wait:elapsed:from: 1)
			-
			('forever'						c	doForever)
			('repeat %n'						c	doRepeat 10)
			-
			('broadcast %e'					-	broadcast:)
			('broadcast %e and wait'			s	doBroadcastAndWait)
			('when I receive %e'			E	-)
			-
			('forever if %b'					c	doForeverIf)
			('if %b'							c	doIf)
			('if %b'							c	doIfElse)
			('wait until %b'					s	doWaitUntil)
			('repeat until %b'				c	doUntil)
			-
			('stop script'					s	doReturn)
			('stop all'						-	stopAll)
		'operators'
			('%n + %n'						r	+ - -)
			('%n - %n'						r	- - -)
			('%n * %n'						r	* - -)
			('%n / %n'						r	/ - -)
			-
			('pick random %n to %n'		r	randomFrom:to: 1 10)
			-
			('%s < %s'						b	< '' '')
			('%s = %s'						b	= '' '')
			('%s > %s'						b	> '' '')
			-
			('%b and %b'					b	&)
			('%b or %b'						b	|)
			('not %b'						b	not)
			-
			('join %s %s'					r	concatenate:with: 'hello ' 'world')
			('letter %n of %s'				r	letter:of: 1 'world')
			('length of %s'					r	stringLength: 'world')
			-
			('%n mod %n'					r	\\ - -)
			('round %n'						r	rounded -)
			-
			('%f of %n'						r	computeFunction:of: 'sqrt' 10)
		'sound'
			('play sound %S'				-	playSound:)
			('play sound %S until done'		s	doPlaySoundAndWait)
			('stop all sounds'				-	stopAllSounds)
			-
			('play drum %D for %n beats'	t 	drum:duration:elapsed:from: 48 0.2)
			('rest for %n beats'				t 	rest:elapsed:from: 0.2)
			-
			('play note %N for %n beats'	t	noteOn:duration:elapsed:from: 60 0.5)
			('set instrument to %I'			- 	midiInstrument: 1)
			-
			('change volume by %n'		- 	changeVolumeBy: -10)
			('set volume to %n%'			- 	setVolumeTo: 100)
			('volume'						r 	volume)
			-
			('change tempo by %n'			- 	changeTempoBy: 20)
			('set tempo to %n bpm'			- 	setTempoTo: 60)
			('tempo'							r 	tempo)
		'motor'
			('motor on for %n secs'			t	motorOnFor:elapsed:from: 1)
			('motor on'						-	allMotorsOn)
			('motor off'						-	allMotorsOff)
			('motor power %n'				-	startMotorPower: 100)
			('motor direction %W'			-	setMotorDirection: 'this way')
		'variables'
			('show variable %v'				-	showVariable:)
			('hide variable %v'				-	hideVariable:)
		'list'
			('add %s to %L'					-	append:toList: 'thing')
			-
			('delete %y of %L'				-	deleteLine:ofList: 1)
			('insert %s at %i of %L'			-	insert:at:ofList: 'thing' 1)
			('replace item %i of %L with %s'		-	setLine:ofList:to: 1 'list' 'thing')
			-
			('item %i of %L'					r	getLine:ofList: 1)
			('length of %L'					r	lineCountOfList:)
			('%L contains %s'				b	list:contains: 'list' 'thing')
	).

	^ blocks, self obsoleteBlockSpecs
