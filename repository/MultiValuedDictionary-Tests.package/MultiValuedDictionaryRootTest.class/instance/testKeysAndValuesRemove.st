test - removing
testKeysAndValuesRemove
	self
		should: [ self nonEmptyDict keysAndValuesRemove: [ :key :value | 'whatever' ] ]
		raise: Error