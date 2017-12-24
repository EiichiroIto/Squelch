api projectSpec
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ 
			spec
				configuration: 'PharoSound'
					with: [ 
							spec
								versionString: #stable;
								repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo50/main' ];
				yourself.
			spec
				package: 'Squelch'
					with: [ spec requires: #('PharoSound') ];
				yourself.
			spec
				package: 'Morphic-Core'
					with: [ spec requires: #() ];
				yourself.
			spec
				group: 'default' with: #('Morphic-Core' 'Squelch');
				yourself ]