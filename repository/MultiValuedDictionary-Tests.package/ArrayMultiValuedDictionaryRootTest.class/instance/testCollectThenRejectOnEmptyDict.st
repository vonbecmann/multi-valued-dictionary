tests
testCollectThenRejectOnEmptyDict

	self assert: (self newEmptyDict collect: [ :e | self fail ] thenReject: [ :e | self fail ]) isEmpty