as yet unclassified
drawOn: aCanvas
	"Draw myself by painting my tile form repeatedly to cover my extent."

	| myBox clipC |
	"myBox has integer position and extent and has a potentially inset bottom"
	myBox := bounds origin truncated corner: bounds corner truncated.
	clipC := aCanvas copyClipRect: myBox.

	(myBox top to: myBox bottom by: tileForm height) do: [:y |
		(myBox left to: myBox right by: tileForm width) do: [:x |
			clipC paintImage: tileForm at: x@y]].

