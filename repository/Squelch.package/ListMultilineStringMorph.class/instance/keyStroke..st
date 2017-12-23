event handling
keyStroke: evt

	| ch ownerList newCell oldH |
	ch := evt keyValue.
	ownerList := self meOrOwnerThatIsA: ScratchListMorph.

	"insert list item with cr"
	(ch = 3) & (evt buttons = 0) ifTrue: [ch := 13].	"map enter key to cr"
	(ch = 13) ifTrue: [
		ownerList ifNotNil:[
			newCell := ownerList insertLine: '' at: ownerList focusIndex + 1.
			ownerList focusCell: newCell].
		^ self].

	"skip to previous list item with tab or down arrow"
	(ch = 30) ifTrue: [
		ownerList ifNotNil:[
			ownerList focusIndex: ownerList focusIndex - 1].
		^ self].

	"skip to next list item with tab or down arrow"
	(ch = 9) | (ch = 31) ifTrue: [
		ownerList ifNotNil:[
			ownerList focusIndex: ownerList focusIndex + 1].
		^ self].

	oldH := self height.
	super keyStroke: evt.
	(ownerList notNil and: [self height ~= oldH]) ifTrue: [
		ownerList extent: ownerList extent].  "force re-layout"
	self fixLayout.
