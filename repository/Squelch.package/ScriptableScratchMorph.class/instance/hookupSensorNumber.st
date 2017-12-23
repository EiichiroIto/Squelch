sensing ops
hookupSensorNumber
	"Backwards compatibility for old blocks."

	^ (1 to: 8) collect: [:n | n printString]
