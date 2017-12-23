private
updateHighlight

	| sFrame viewedObj |
	(sFrame := self meOrOwnerThatIsA: ScratchFrameMorph) ifNil: [^ self].
	viewedObj := sFrame viewerPane target.

	scrollPane contents submorphs do: [:m | 
		m highlight: (m target = viewedObj)].
	stagePane submorphs do: [:m | 
		m highlight: (m target = viewedObj)].
