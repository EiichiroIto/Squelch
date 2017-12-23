private
tupleSequence
	"Answer an array with a single tuple describing this comment."

	anchor isNil
		ifTrue: [
			^ Array with:
				(Array
					with: #scratchComment
					with: commentMorph contents
					with: isShowing
					with: self width)]
		ifFalse: [
			^ Array with:
				(Array
					with: #scratchComment
					with: commentMorph contents
					with: isShowing
					with: self width
					with: anchor blockID)]
