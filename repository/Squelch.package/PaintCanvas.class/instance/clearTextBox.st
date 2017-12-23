private
clearTextBox

	textBox contents: ''.
	textBox position: (self extent // 2) - (50@25).
	textBox extent: (self extent - textBox topLeft).
