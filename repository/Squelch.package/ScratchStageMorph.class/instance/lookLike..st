looks ops
lookLike: costumeName
	"Change to the costume with the given name. Noop if there is no costume of the given name in my library."

	zoom := 100.
	hPan := 0.
	vPan := 0.
	super lookLike: costumeName.
