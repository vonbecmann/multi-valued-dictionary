requirements
sizeCollection
	^ (MultiValuedDictionary dictionary: Dictionary collection: OrderedCollection)
		add: 'B' -> (OrderedCollection with: 3 with: 7);
		yourself