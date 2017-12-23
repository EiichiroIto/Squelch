private
drawSelectionOn: aCanvas

	| x y lightColor darkColor v1 v2 offsetX s1 s2 bottom |

	editor selectionNil ifTrue: [^ self].

	lightColor := Color lightBlue. "(Color r: 0.2 g: 1.0 b: 0.907)."
	darkColor := lightColor darker darker darker.

	v1 := (editor graph startIndex asInteger max: 1) min: data size.
	v2 := v1 + (bounds width/(editor graph scale)) min: data size.
	

	offsetX := bounds left + borderWidth.
	x := (offsetX + ((selection first - startIndex)*scale)).
	y := bounds top + borderWidth.

	viewer 
		ifFalse: [
			selection first > v2 ifTrue: [^ self].  "selection is not visible"
			selection last < v1 ifTrue: [^ self].  "selection is not visible"

			aCanvas
				fillRectangle: (x@y extent: ((selection last - selection first)*scale)@(self height - (2 * borderWidth)))
				color: lightColor. "lightYellow"]
		ifTrue: [
			s1 := selection first.
			s2 := selection second.

			bottom := self height - (2 * borderWidth).


			((s1 max: s2) <= v1) | ((s1 min: s2) >= v2)
				ifTrue: [^aCanvas 				
							fillRectangle: ((offsetX + (s1*scale))@y extent: ((s2-s1)*scale)@bottom)
							color: darkColor.].
			
			(s1 <= v1) & (s2 >= v2)
				ifTrue: [^aCanvas fillRectangle: ((offsetX + (s1*scale))@y extent: ((v1-s1)*scale)@bottom)
								color: darkColor;
								fillRectangle: ((offsetX + (v1*scale))@y extent: ((v2-v1)*scale)@bottom)
								color: lightColor;
								fillRectangle: (( offsetX + (v2*scale))@y extent: ((s2-v2)*scale)@bottom)
								color: darkColor.].
			
			(s1 >= v1) & (s2 <= v2)
				ifTrue: [^aCanvas
							fillRectangle: ((offsetX + (s1*scale))@y extent: ((s2-s1)*scale)@bottom)
							color: lightColor.].
	
			(s1 < v1) & (s2 > v1) & (s2 < v2)
				ifTrue: [^aCanvas
							fillRectangle: ((offsetX + (s1*scale))@y extent: ((v1-s1)*scale)@bottom)
							color: darkColor;
							fillRectangle: ((offsetX + (v1*scale))@y extent: ((s2- v1)*scale)@bottom)
							color: lightColor.].
		
			(s1 >= v1) & (s2 >= v2) 
				ifTrue: [^aCanvas
							fillRectangle: ((offsetX + (s1*scale))@y extent: ((v2-s1)*scale)@bottom)
							color: lightColor;
							fillRectangle: ((offsetX + (v2*scale))@y extent: ((s2 - v2)*scale)@bottom)
							color: darkColor.].

			"Transcript show: 'no category :(';cr."

			].



