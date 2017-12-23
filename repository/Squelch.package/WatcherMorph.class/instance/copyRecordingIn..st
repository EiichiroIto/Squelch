copying
copyRecordingIn: dict
	"Overridden to copy my readout if it is not currently showing. This avoids accidentally sharing the readout morph with the original Watcher that is being copied. If the readout is showing, it is copied by the fullCopy operation, so we don't need to copy it."

	| result |
	result := super copyRecordingIn: dict.
	readoutFrame owner ifNil: [result readoutFrame: readoutFrame fullCopy].
	^ result
