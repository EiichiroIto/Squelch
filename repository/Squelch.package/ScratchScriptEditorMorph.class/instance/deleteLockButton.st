private
deleteLockButton
	"Delete my lock button."

	lockButton ifNotNil: [
		lockButton delete.
		lockButton := nil].
