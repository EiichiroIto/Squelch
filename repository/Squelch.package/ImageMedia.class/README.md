I am a Scratch image media object. I hold a still image that can be used as the costume for a Scratch object.

Instance variables:
	form			my form
	rotationCenter	my rotation center
	textBox			optional text layer
	jpegBytes		optional JPEG data for this image if it was compressed
	compositeForm	form that combines my base form with my text layer; same as form if no text

When there is no text layer and the image contains no transparent pixels, it can be compressed using JPEG. In that case, jpegBytes contains the compressed image and form is just a cache of decompressed image. If the image is not edited, the original jpegBytes are retained and saved with the project to avoid losing quality through repeated compress/decompress cycles.

When there is a text layer, compositeForm caches the base form with the text painted on top of it. This composite image is saved with the project to allow the Java player to use it. (Since the Java player does not have the same set of fonts as Scratch, it is not possible for it to recreate the compositeForm.)
