change reporting
invalidRect: damageRect

	damageRecorder recordInvalidRect: (damageRect intersect: bounds).
