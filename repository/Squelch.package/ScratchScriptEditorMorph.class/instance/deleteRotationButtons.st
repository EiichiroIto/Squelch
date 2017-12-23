private
deleteRotationButtons
	"Delete the rotation style buttons."

	rotationButtons do: [:m | m delete].
	rotationButtons := #().
