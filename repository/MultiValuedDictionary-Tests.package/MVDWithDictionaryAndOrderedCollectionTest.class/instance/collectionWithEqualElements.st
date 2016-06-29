requirements
collectionWithEqualElements
	" return a collection including atLeast two elements equal"

	^ (MultiValuedDictionary dictionary: self dictionaryClass collection: OrderedCollection)
		add: #A -> duplicatedElement;
		add: #B -> 3.5;
		add: #C -> duplicatedElement;
		yourself