requirements
collectionWithEqualElements
	" return a collection including atLeast two elements equal"

	^ (self newEmptyDict)
		add: #A -> duplicatedElement;
		add: #B -> 3.5;
		add: #C -> duplicatedElement;
		yourself