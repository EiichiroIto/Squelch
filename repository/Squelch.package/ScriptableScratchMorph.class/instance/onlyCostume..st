media
onlyCostume: aForm
	"Remove all my costumes, then make a new costume using the given Form."

	| el |
	media := media select: [:m | m isSound].

	el := ImageMedia new form: aForm.
	el mediaName: 'costume'.
	media addLast: el.
	self lookLike: el mediaName.
	self updateMediaCategory.
