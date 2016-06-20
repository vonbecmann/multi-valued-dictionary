requirements
nonEmpty
	^ (MultiValuedDictionary dictionary: Dictionary collection: OrderedCollection)
		add: #nonEmpty -> #(1 2);
		yourself