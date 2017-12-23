This class allows you to extract any font from a screen shot of it.

Here's the process:

For best results, turn off font anti-aliasing or set your screen depth to one-bit. Then create the text file 'strike.txt' by doing:

	FontExtractor writeStrikeFile

Open that file in text editor and set the font to the desired font, style, and size. Make a screen shot of the text editor and store it in a graphics format readable by Squeak, such as BMP, PNG, or GIF (but NOT JPEG). Use your favorite image editor to crop the screen shot to a rectangle containing all the letters of the font, leaving a few pixels of white space around the edges. Don't include the window borders or anything outside of the window containing the font. You should end up with just the letters of the font in black on a plain white background.

Now process that font by doing:

	font := FontExtractor extractFontFromFileNamed: 'yourFileName'

To do:
  [ ] handle two or more missing characters in a row (glyphsForLine:)
