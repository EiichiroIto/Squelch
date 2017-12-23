private
fixProjectTitleMorphLayout
 
	| s truncated eWidth w |

	projectName ifNotNil: [
		s :=  (self nameFromFileName: projectName).
		"trim project name to fit, if necessary"
		truncated := false.
		eWidth := (ScratchTranslator stringExtent: '...' font: projectTitleMorph font) x.
		w := titlePane width - 100 - eWidth.
		[((ScratchTranslator stringExtent: s font: projectTitleMorph font) x) > w] whileTrue: [
			truncated := true.
			s := s copyFrom: 1 to: s size - 1].
		truncated ifTrue: [s := s, '...'].
		projectTitleMorph contents: s].
