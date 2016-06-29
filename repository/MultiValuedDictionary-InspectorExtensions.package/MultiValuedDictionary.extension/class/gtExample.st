*MultiValuedDictionary-InspectorExtensions
gtExample
	<gtExample>
	^ (self dictionary: Dictionary collection: OrderedCollection)
		add: #a -> 'hello world';
		add: #b -> 2.5;
		add: #c -> #(4 #symbol $a);
		yourself