running
setUp
	nonEmptyDict := (MultiValuedDictionary dictionary: Dictionary collection: OrderedCollection)
		add: #a -> 'hello_world';
		add: #b -> #(2 3);
		add: #c -> {4 . 5};
		add: #d -> {6 . 7};
		add: #e -> 8;
		yourself