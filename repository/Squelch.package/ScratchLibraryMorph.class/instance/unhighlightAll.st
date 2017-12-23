private
unhighlightAll

	scrollPane contents submorphs do: [:m | m highlight: false].
	stagePane submorphs do: [:m | m highlight: false].
