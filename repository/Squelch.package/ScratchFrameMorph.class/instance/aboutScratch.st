menu/button actions
aboutScratch

	| dialogBox |
	dialogBox := DialogBoxMorph new
		title: 'About Scratch';
		withButtonsForYes: false no: false okay: true cancel: false.
	dialogBox
		message: 'Based on Scratch from the MIT Media Lab, v', Version, '

Copyright © 2009 Massachusetts Institute of Technology.
All rights reserved.

Developed by the Lifelong Kindergarten Group at the MIT Media Lab,
with support from the National Science Foundation, Microsoft, Intel,
Nokia, and MIT Media Lab research consortia.

http://info.scratch.mit.edu/Source_Code
'
		font: (ScratchFrameMorph getFont: #AboutScratch).

	dialogBox getUserResponse.
