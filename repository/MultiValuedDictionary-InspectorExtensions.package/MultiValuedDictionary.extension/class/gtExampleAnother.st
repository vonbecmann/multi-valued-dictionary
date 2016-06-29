*MultiValuedDictionary-InspectorExtensions
gtExampleAnother
	<gtExample>
	^ (self dictionary: Dictionary collection: OrderedCollection)
		add: 1 -> #a;
		add: 2 -> #b;
		add: 3 -> #(#b #c);
		yourself