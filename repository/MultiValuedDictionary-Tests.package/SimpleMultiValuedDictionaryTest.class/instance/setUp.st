running
setUp
	nonEmptyDict := (MultiValuedDictionary dictionary: self dictionaryClass collection: self valueCollectionClass)
		add: #a -> self elementTwiceIn;
		add: #b -> 30;
		add: #c -> self elementTwiceIn;
		add: #d -> -2;
		yourself.
	duplicatedElement := 2.5