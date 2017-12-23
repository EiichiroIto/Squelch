accessing
sensorValueFor: sensorName
	"Answer the value for the given virtual sensor or nil if the given sensor name is not found."

	^ sensors at: sensorName ifAbsent: [nil]

