playing
motionStep

	(prevFrameForm isNil or:
	 [prevFrameForm extent ~= frameForm extent]) ifTrue: [
		prevFrameForm := frameForm deepCopy].

	(historyForm isNil or:
	 [historyForm extent ~= frameForm extent]) ifTrue: [
		historyForm := ColorForm extent: frameForm extent depth: 8.
		historyForm colors:
			(Array with: Color transparent), (Array new: 255 withAll: Color blue)].

	VideoSensorPlugin
		motionHistoryMap: frameForm bits
		and: prevFrameForm
		bits to: historyForm bits
		threshold: 40
		historyCount: 4.

	prevFrameForm bits: frameForm bits copy.  "optimization"
	historyForm displayOn: frameForm at: 0@0 rule: Form paint.
