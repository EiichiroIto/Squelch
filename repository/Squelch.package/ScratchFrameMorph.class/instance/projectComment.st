accessing
projectComment

	^ projectInfo at: 'comment' ifAbsent: ['']
