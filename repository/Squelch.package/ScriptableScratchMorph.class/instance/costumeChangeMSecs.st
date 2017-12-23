accessing
costumeChangeMSecs
	"Answer the time of the last costume change. Whenever a costume change (or a filter change) occurs, this value is updated from the current millisecond clock. This value is used to optimize redrawing of thumbnails--if costumeChangeMSecs hasn't changed since the last time the thumbnail was updated we don't need to compute a new thumbnail."

	^ costumeChangeMSecs
