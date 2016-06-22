testing
identityIncludes: anObject
	"Answer whether anObject is one of the receiver's elements."

	self valuesDo: [ :each | anObject == each ifTrue: [ ^ true ] ].
	^ false