test - comparing
testEquality
	| nonEmptyDict2 |
	nonEmptyDict2 := self newEmptyDict.
	self nonEmpty keysAndValuesDo:  [ :key :value | nonEmptyDict2 at: key put: value  ].
	
	self assert: (self nonEmptyDict = nonEmptyDict2)