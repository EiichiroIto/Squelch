viewing
setScale

	| menu choice |

	menu := CustomMenu new.
	menu add: '1x' action: '1';
		   add: '2x' action: '2';
		   add: '3x' action: '3';
		   add: '4x' action: '4';
		   add: '5x' action: '5';
		   add: 'other' action: #customScale.
	choice := menu startUp.
	choice ifNil: [^self].

	choice = #customScale 
		ifFalse: [self scale: choice asNumber.]	
		ifTrue: [ self customScale].