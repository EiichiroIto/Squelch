events
mouseDown: evt

	"Handles mouse down and drag events.  Updates the cursor's position and sets the selection to an array containing two copies of the current cursor value."
	| x s |

	 x := evt cursorPoint x - (bounds left + borderWidth).

	s := editor startSelection.
	editor startSelection: editor cursor.  
	editor cursor: startIndex + (x/scale).
		
	evt shiftPressed
		ifTrue: [  editor selectionNil 
					ifFalse: [
						editor startSelection: s.
				  		self adjustSelection.].]
		ifFalse: [
				 ((editor selectionNil not) and: [(selection at: 2) - (selection at: 1) > 3])
						ifTrue: [ editor selection: nil.
			  				      self flushCachedForm.
				 				 self changed.].
			  	 editor startSelection: editor cursor.
				 editor selection: {editor cursor. editor cursor}.].


	 
	
	