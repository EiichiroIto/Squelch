language translation
formattingSectionForPOT

	| s |
	s :=
'# Language name as you''d like it to appear in the Languages menu
# (Required)
msgid "Language-Name"
msgstr ""

# Directionality of language
# LTR = Left to Right
# RTL = Right to Left
msgid "Language-Direction"
msgstr ""

# Scale to apply to font size (2 for twice as large)
# Use this if the font is too small for legibility on the Scratch interface
msgid "Font-Scale"
msgstr ""

# Set to ''true'' or ''false''
# Use this if you do not want any of the text to be bolded, for legibility
msgid "Suppress-Bold"
msgstr ""

# Font to use on a Windows system
msgid "Win-Font"
msgstr ""

# Font to use on a Mac system
msgid "Mac-Font"
msgstr ""

# Font to use on a Linux system
msgid "Linux-Font"
msgstr ""

'.

	s := s copyReplaceTokens: String cr with: String crlf.

	^ s.
