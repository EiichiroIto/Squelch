I represent the Squeak interface to a sensor board connected via a serial port. One such board, the Scratch Board, has 8 10-bit sensor inputs capable of reading switches or resistive sensors. Another alternative, the GoGoBoard, has 8 10-bit sensors inputs plus three motor control ports. See http://learning.media.mit.edu/projects/gogo/ for additional info about the GoGo board.

To create an instance of me:

	SensorBoardMorph open

(Note: You can only have one instance of me for each serial port that has a Scratch or GoGo board attached.)

Use the menu to choose the serial port. When you're done, you can use the menu to close the serial port.


------------------------------------------------------
Scratch Sensor Board Serial Protocol

When the sensor board is powered up or reset, it immediately begins sending
sensor data. Sensor data is sent as two byte messages, one message for each
of the available sensors. The first byte supplies the sensor number and the
high 3 bits of the sensor value. The second byte supplies the low 7 bits
of the sensor value. The values of all the available sensors are sent in
this format, followed by a pause of two full byte transmission times, then
the entire cycle repeats. The pause allows the receiver's UART to regain
synchronization in the rare event that it is lost.

Here is the byte format for the two bytes:

  Byte1: <1><sensor number (4 bits)><sensor value high bits (3 bits)>
  Byte2: <0><sensor value low bits (7 bits)>

Note that the most significant bit is one for the first byte of a pair
and zero for the second. This allows the receiver to tell if a given
byte is the first or second byte of a message.

Sensor board have various numbers of sensors. A given board with N sensors
will cycle through sensors numbers 0 through N-1, then repeat. For example,
a four-sensor board would send data for sensors 0 through 3. Up to sixteen
sensors can be handled by this protocol.

Sensor values should be normalized to fit a 10-bit, unsigned integer range.
That is, sensor values should range from 0 to ~1023. For example, if a given
sensor board only collects 8-bit values, these values should be shifted left
by two bits so that the maximum value is 1020. Likewise, a board that reads
over 10-bits of sensor resolution should shift its sensor values right so
that only the 10 most-significant bits of the data are sent.

The serial port should be set to 38.4 kbaud, one start bit, one stop bit,
and no parity.
------------------------------------------------------

