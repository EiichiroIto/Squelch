private
deleteDeleteButton
	"Delete my delete button."

	deleteButton ifNotNil: [
		deleteButton delete.
		deleteButton := nil].
