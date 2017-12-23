I am a paint editor that supports scrolling and scaling.


My instance variables are:
	palette				the UI for my drawing tool state
	canvasForm			the current contents of my painting
	bgForm				checkerboard pattern for showing transparent areas
	feedbackForm		holds feedback during line/rect/oval drawing; same extent as canvasForm
	bufferForm			used for updating my view on the screen
	undoList			keeps copies of recent canvasForms for undo
	undoIndex			index of current undo recorder
	scale				current scale factor
	scrollX				horizontal scroll in canvasForm coordinates
	scrollY				vertical scroll in canvasForm coordinates
	startPoint			starting point of current drag in canvasForm coordinates
	lastPoint			previous point of current drag in canvasForm coordinates
	brush				the Pen used for paint/erase
	moveOrStampForm	holds the image being moved or stamped
	textBox				holds editable text (although this is a morph, it is not in the world)
	textForm			holds text layer bitmap; same extent as canvasForm
	textDragMode		what to do when dragging in text mode (select, move, resize, etc.)
	textDragoffset		offset used during textBox moving and resizing

