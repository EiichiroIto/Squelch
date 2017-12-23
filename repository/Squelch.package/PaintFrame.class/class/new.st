instance creation
new

	^ super new
		withButtonsForYes: false no: false okay: true cancel: true;
		title: 'Paint Editor';
		extent: 800@490
