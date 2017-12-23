private
noteChangeAtIndex: index

	lastActivityIndex := index.	

	cellMorphs size < 20
		ifTrue: [
			self updateContents.
			(index between: 1 and: numberMorphs size) ifTrue: [
				(numberMorphs at: index) color: (Color white).
				highlightActive := true].
			lastActivityIndex := nil]
		ifFalse: [
			listLayoutNeeded := true].
