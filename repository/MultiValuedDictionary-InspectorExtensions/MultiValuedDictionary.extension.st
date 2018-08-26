Extension { #name : #MultiValuedDictionary }

{ #category : #'*MultiValuedDictionary-InspectorExtensions' }
MultiValuedDictionary >> gtDisplayOn: s [
	self printNameOn: s.
	s
		space;
		nextPut: $[;
		nextPutAll: self size asString;
		nextPutAll:
			(self size = 1
				ifTrue: [ ' item' ]
				ifFalse: [ ' items' ]);
		nextPut: $];
		space.
	self printElementsOn: s
]

{ #category : #'*MultiValuedDictionary-InspectorExtensions' }
MultiValuedDictionary class >> gtExample [
	<gtExample>
	^ (self dictionary: Dictionary collection: OrderedCollection)
		add: #a -> 'hello world';
		add: #b -> 2.5;
		add: #c -> 4;
		add: #c -> #symbol;
		add: #c -> $a;
		yourself
]

{ #category : #'*MultiValuedDictionary-InspectorExtensions' }
MultiValuedDictionary class >> gtExampleAnother [
	<gtExample>
	^ (self dictionary: Dictionary collection: OrderedCollection)
		add: 1 -> #a;
		add: 2 -> #b;
		add: 3 -> #b;
		add: 3 -> #c;
		yourself
]

{ #category : #'*MultiValuedDictionary-InspectorExtensions' }
MultiValuedDictionary >> gtInspectorItemsIn: composite [
	<gtInspectorPresentationOrder: 0>
	^ composite table
		title: 'Items';
		display: [ self associations ];
		column: 'Key' evaluated: [ :each | GTObjectPrinter new asTruncatedTextFrom: each key ];
		column: 'Value'
			evaluated: [ :each | GTObjectPrinter new asTruncatedTextFrom: each value ];
		send: [ :each | each value ];
		showOnly: 50;
		yourself
]

{ #category : #'*MultiValuedDictionary-InspectorExtensions' }
MultiValuedDictionary >> gtInspectorKeyValuesIn: composite [
	<gtInspectorPresentationOrder: 2>
	^ composite fastTable
		title: 'Key->Values';
		display: [ dictionary associations ];
		column: 'Key' evaluated: [ :each | GTObjectPrinter asTruncatedTextFrom: each key ];
		column: 'Value' evaluated: [ :each | GTObjectPrinter asTruncatedTextFrom: each value ];
		send: [ :each | each value ];
		showOnly: 50;
		yourself
]

{ #category : #'*MultiValuedDictionary-InspectorExtensions' }
MultiValuedDictionary >> gtInspectorKeysIn: composite [
	<gtInspectorPresentationOrder: 1>
	^ composite list
		title: 'Keys';
		display: [ self keys ]
]
