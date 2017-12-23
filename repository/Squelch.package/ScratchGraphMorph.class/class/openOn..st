instance creation
openOn: dataCollection
	"Open a new GraphMorph on the given sequencable collection of data."

	^ (self new data: dataCollection) openInWorld
