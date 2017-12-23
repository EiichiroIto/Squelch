Unicode rendering
centerOffsetForLabelWithFont: aStrikeFont
	
	| co |
	co := self centerOffsetForButtonWithFont: aStrikeFont.
	^ co - 8.
