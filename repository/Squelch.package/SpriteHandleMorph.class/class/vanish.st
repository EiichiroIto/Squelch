accessing
vanish
	"delete my single instance"

	Current ifNotNil: [
		Current delete.
		Current := nil ]