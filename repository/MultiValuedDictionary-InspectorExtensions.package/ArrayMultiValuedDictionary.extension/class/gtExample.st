*MultiValuedDictionary-InspectorExtensions
gtExample
	<gtExample>
	^ (self dictionary: Dictionary)
		add: #a -> 'hello world';
		add: #b -> 2.5;
		add: #c -> #(4 #symbol $a);
		yourself