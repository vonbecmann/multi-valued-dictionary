adding
addAll: aKeyedCollection
	aKeyedCollection == self
		ifFalse: [ 
			aKeyedCollection keysAndValuesDo: [ :key :value | self add: (key -> value) ] ].
	^ aKeyedCollection