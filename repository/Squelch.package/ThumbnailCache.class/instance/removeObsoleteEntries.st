other
removeObsoleteEntries
	"Remove obsolete entries from the dictionary. A thumbnail cache entry is obsolete if (a) the file is no longer found in the directory or (b) the size of the file does not match the files size in the cache entry. Return true if any entries were removed."
	"Note: Originally we used file modification times to detect when a cache entry became obsolete (e.g. because a file was edited). However, these timestamps could change with transitions to/from daylight savings time and when moving laptops between timezones. We now use the file size which is very likely to change when a graphics file is edited. Although there is a small change that an invalid cache entry will not be detected, in that case the obsolete chache entry will probably be very similar in appearance to the edited image. In the worst case, one can manually delete the thumbnails cache file to force the cache to be regenerated."

	| didRemove fSize |
	didRemove := false.
	dict keys do: [:fn |
		fSize := fileSizes at: fn ifAbsent: [0].
		((dict at: fn) at: 1) ~= fSize ifTrue: [
			didRemove := true.
			dict removeKey: fn]].
	^ didRemove
