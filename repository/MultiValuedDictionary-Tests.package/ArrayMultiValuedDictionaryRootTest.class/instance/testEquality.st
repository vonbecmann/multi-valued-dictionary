test - comparing
testEquality
	| nonEmptyDict2 |
	nonEmptyDict2 := self newEmptyDict.
	self nonEmpty keysAndValuesDo:  [ :key :values | nonEmptyDict2 at: key putAll: values  ].
	
	self assert: (self nonEmptyDict = nonEmptyDict2)