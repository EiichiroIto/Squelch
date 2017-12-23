change reporting
redrawAll

	damageRecorder reset.
	submorphs do: [:m | m changed].
