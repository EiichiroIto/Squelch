An editable, multiple-line string in a single font with line wrapping and scrolling.

Best for small amounts of text; for longer texts or texts with multiple type styles, see TextMorph.

My contents are stored in an array of strings ('lines') with all non-printing characters except cr's and spaces stripped out and tabs replaced by a sequence of spaces.

Possible improvements:
  a. handle tabs correctly
  b. preserve non-printing characters (could be useful for editing files)
