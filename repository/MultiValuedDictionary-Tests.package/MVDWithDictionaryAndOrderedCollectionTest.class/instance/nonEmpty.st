requirements
nonEmpty
	^ (MultiValuedDictionary dictionary: Dictionary collection: OrderedCollection)
		add: 'nonEmpty' -> (OrderedCollection with: 1 with: 2);
		yourself