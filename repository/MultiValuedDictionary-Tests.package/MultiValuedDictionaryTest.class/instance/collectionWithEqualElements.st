requirements
collectionWithEqualElements
	" return a collection including atLeast two elements equal"

	^ (MultiValuedDictionary dictionary: self dictionaryClass collection: self valueCollectionClass)
		add: #A -> duplicatedElement;
		add: #B -> 3.5;
		add: #C -> duplicatedElement;
		yourself