comparing
= aMultiValuedDictionary
	self == aMultiValuedDictionary
		ifTrue: [ ^ true ].
	self class == aMultiValuedDictionary class
		ifFalse: [ ^ false ].
	self size = aMultiValuedDictionary size
		ifFalse: [ ^ false ].
	^ true