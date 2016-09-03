enumerating
allSatisfy: aBlock
	"Evaluate aBlock with the elements of the receiver.
	If aBlock returns false for any element return false.
	Otherwise return true."

	self valuesDo: [ :each | (aBlock value: each) ifFalse: [ ^ false ] ].
	^ true