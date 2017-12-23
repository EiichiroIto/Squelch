accessing
isLarge
	"Support for reading old Watchers; do not remove!"

	^ submorphs size > 0 and: [self firstSubmorph font pointSize > 10]
