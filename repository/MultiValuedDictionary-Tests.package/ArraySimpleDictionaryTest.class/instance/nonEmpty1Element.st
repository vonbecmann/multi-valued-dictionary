requirements
nonEmpty1Element
	" return a collection of size 1 including one element"

	^ (self newEmptyDict)
		add: #a -> 5;
		yourself