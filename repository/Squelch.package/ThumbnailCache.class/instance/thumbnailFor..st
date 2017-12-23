other
thumbnailFor: fileName

	^ (dict at: fileName ifAbsent: [^ nil]) at: 2
