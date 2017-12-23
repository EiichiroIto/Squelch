drawing
drawString: s at: aPoint on: aCanvas

	aCanvas
		drawString: s
		in: (aPoint corner: self bottomRight)
		font: (StrikeFont fontName: 'VerdanaBold' size: 18)
		color: Color black