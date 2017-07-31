test - adding
testAddAll
	
	| collectionToAdd collection result oldSize |
	collection := self nonEmptyDict .
	oldSize := collection size.
	collectionToAdd := self newEmptyDict 
		add: self associationWithKeyAlreadyInToAdd ; 
		add: self associationWithKeyNotInToAdd ; 
		yourself.
	
	result := collection addAll: collectionToAdd .
	
	self assert: result = collectionToAdd .
	"  the association with the key already in should have replaced the oldest :"
	self assert: collection  size = (oldSize + 2).
	
	result associationsDo: [:assoc | self assert: ((collection at: assoc key) includes: assoc value)].