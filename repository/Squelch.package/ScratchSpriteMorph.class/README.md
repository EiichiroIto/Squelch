I represent a programmable Scratch object.

I have a costume, a bitmapped image that can be rotated, scaled, and image-filtered.

The raw Form before any rotation or scaling is stored in originalForm. rotatedForm is a cache of the rotated and scaled version of originalForm.

rotationStyle has three possible values:
	normal		continuous rotation with direction
	leftRight	for directions with x component < 0, flip the bitmap around the y-axis, otherwise no rotation
	none		don't rotate with direction

The leftRight style is useful for side-views of things such as cars, horses, etc.
