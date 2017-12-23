menu
invokeMenu
	"Invoke a menu of additonal functions."

	| aMenu |
	aMenu := CustomMenu new.
	aMenu addList:	#(
		('save to file'		saveToFile)
		('read from file'	readFromFile)).
	aMenu invokeOn: self defaultSelection: nil.

