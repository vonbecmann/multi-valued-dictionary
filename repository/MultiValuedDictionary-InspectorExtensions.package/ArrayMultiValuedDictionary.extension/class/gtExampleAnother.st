*MultiValuedDictionary-InspectorExtensions
gtExampleAnother
	<gtExample>
	^ (self dictionary: Dictionary)
		add: 1 -> #a;
		add: 2 -> #b;
		add: 3 -> #b;
		add: 3 -> #c;
		yourself