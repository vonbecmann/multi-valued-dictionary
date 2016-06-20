requirements
collectionWithoutNilElements
	^ (MultiValuedDictionary dictionary: Dictionary collection: OrderedCollection)
		add: #a -> 1;
		add: #b -> (OrderedCollection with: 2 with: 3);
		add: #c -> (OrderedCollection with: 4 with: 5);
		yourself