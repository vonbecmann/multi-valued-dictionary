requirements
nonEmpty
	^ (MultiValuedDictionary dictionary: Dictionary collection: OrderedCollection)
		add: #a -> 1;
		add: #b -> #(2 3);
		add: #c -> {4 . 5};
		add: #d -> {6 . 7};
		add: #e -> #();
		yourself