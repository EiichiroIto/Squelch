A sound editor, based on the wave editor.  It can be brought up by the SoundMorph.  When the soundEditor is brought up, it is created with a copy of the sound in the sound morph. It contains the sound of the soundmorph and is capable of editing that sound.  That sound is set in the method "sound:"

"viewing"
graph 					GraphMorph			
viewer					GraphMorph
selection 				    Array				an array of 2 #s that are the start and end of the selection.  This and the next 2 												variables are in terms of indices of the graph data
startSelection 			   Number				a number indicating the constant pt in a selection (mouse down loc)
cursor					   Number				a number indicating the location of the cursor

"Scrolling in view"
scrollDelta			        Number				a number telling us how much to scroll by, used in stepping to allow scrolling by 												buttons
slider					   slider morph			a slider for the graph
time					   a number			where we are in the graph in terms os msecs
deltaVal 					number				how much the cursor scrolls by, scrolldelta is set to +- this value
fwdButton 					button				scolling
backButton     				button				scrolling

"Playing variables" 
origSamplingRate 		  big number			indicates the sampling rate of the song @ loading
												so u can reset to that sampling rate.
samplingRate 	         another big number		indicates current sampling rate.	
(2 above aren't currently used)

volume					   slider morph			indicates volume, (0 to 1.0)		
preview						boolean 			whether we're in play all mode or play 	from 												cursor mode, where the cursor moves along with 												the music
"Sound manipulation"
snd 						SampledSound		Current sound used for playing from cursor + selection
completeSnd 				SampledSound		The entire song after editing (doesn't change with playing)
soundMorphSound   			SampledSound		a ref to the sound of the SoundMorph that created this, 
												so that u can change the sound within that sound editor

"Editing tools"
copy						SoundBuffer		the portion of the graph data that has been copied
undoSound 					SampledSound		the sound before any cuts/pastes crops
undoSel 					Array				a copy of the selection bf any cut/paste/crop


rateSlider 					currently not implemented
keyboard