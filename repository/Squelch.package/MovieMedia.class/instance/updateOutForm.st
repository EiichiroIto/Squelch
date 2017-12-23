private
updateOutForm
	"Update my output form."

	| srcRect |
	appearanceChanged := true.
	origForm ifNil: [^ self].  "do nothing during initialization"
	((zoom = 100) & (hPan = 0) & (vPan = 0) and:
	 [outForm extent = origForm extent])
		ifTrue: [  "optimization: no scaling"
			origForm displayOn: outForm]
		ifFalse: [  "scaling needed"
			srcRect := Rectangle
				center: (origForm boundingBox center + (hPan@vPan negated))
				extent: (origForm extent / (zoom asFloat / 100.0)).

			(WarpBlt toForm: outForm)
				sourceForm: origForm;
				colorMap: (origForm colormapIfNeededForDepth: outForm depth);
				cellSize: 1;  "installs a colormap"
				combinationRule: Form over;
				copyQuad: srcRect innerCorners toRect: outForm boundingBox].

	fade < 100 ifTrue: [  "handle fade"
		(BitBlt toForm: outForm)
			destRect: outForm boundingBox;
			fillColor: fadeColor;
			combinationRule: 30;
			copyBitsTranslucent: (2.55 * (100 - fade)) truncated]
ifFalse: [  "workaround to show black around edges when zoomed"
	(BitBlt toForm: outForm)
		destRect: outForm boundingBox;
		fillColor: Color black;
		combinationRule: 30;
		copyBitsTranslucent: 1]. 

	self changed.
