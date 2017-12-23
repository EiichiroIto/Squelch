sensor ops
sensor: sensorIndex
	"Answer the value of the virtual sensor with the given index. Sensors are numbered 1-8."

	^ self privateSensor: sensorIndex
