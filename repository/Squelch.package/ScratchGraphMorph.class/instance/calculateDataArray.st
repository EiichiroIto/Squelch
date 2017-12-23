private
calculateDataArray

	| currIndex neg pos |

	negVals := OrderedCollection new.
	posVals := OrderedCollection new.

	data isEmpty ifTrue: [^ self].
	currIndex := neg := pos := 0.

	(1 to: data size) do: [ :i |
		((i * scale) truncated > currIndex)
			ifTrue: [
			
					currIndex := (i*scale) truncated.		
					neg := neg min: (data at: i).
					pos := pos max: (data at: i).
			
					posVals add: pos.
					negVals	add: neg.
		
					pos := neg := 0.]
			ifFalse: [
						neg := neg min: (data at: i).
						pos := pos max: (data at: i).].].