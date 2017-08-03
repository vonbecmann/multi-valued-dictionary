test - removing
testKeysAndValuesRemove
	self
		should: [ self nonEmptyDict keysAndValuesRemove: [ :key :value | 'What ever here' ] ]
		raise: Error