enumerating
anySatisfy: aBlock
	"Evaluate aBlock with the elements of the receiver.
	If aBlock returns true for any element return true.
	Otherwise return false."

	self valuesDo: [ :each | (aBlock value: each) ifTrue: [ ^ true ] ].
	^ false