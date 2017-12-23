fixed format-reading
getColor: anObject id: classID
	| rgb |
	firstPass
		ifFalse: [ ^ anObject ].
	rgb := stream uint32.
	(self classSymbolForID: classID) = #TranslucentColor
		ifTrue: [ 
			^ Color basicNew
				setRGB: rgb;
				setAlpha: stream next / 255.0 ]
		ifFalse: [ ^ Color basicNew setRGB: rgb; setAlpha: 1.0 ]