testing
includes: anObject
	self valuesDo: [ :each | anObject = each ifTrue: [ ^ true ] ].
	^ false