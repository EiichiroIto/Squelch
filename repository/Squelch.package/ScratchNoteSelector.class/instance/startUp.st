interaction
startUp
	"Waits for the user to click a value or to click outside, then returns the selected note or nil."

	| w result |
	self openInWorld.
	w := self world.
	Sensor waitNoButton.  "start with mouse up"
	w doOneCycle.
	w activeHand newMouseFocus: self.
	selectedVal := nil.
	done := false.
	[done] whileFalse: [
		(w activeHand hasMouseFocus: self) ifFalse: [done := true].
		w doOneCycle].

	result := selectedVal.
	self shutDown.
	^ result
