initialization
buildSpriteLabel

	^ StringMorph new
		font: (ScratchFrameMorph getFont: #Tab);
		color: Color white;
		contents: 'New sprite:' localized
