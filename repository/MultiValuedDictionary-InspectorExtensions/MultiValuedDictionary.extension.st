Extension { #name : #MultiValuedDictionary }

{ #category : #'*MultiValuedDictionary-InspectorExtensions' }
MultiValuedDictionary class >> example [

	<sampleInstance>
	^ (self dictionary: Dictionary collection: OrderedCollection)
		  add: #a -> 'hello world';
		  add: #b -> 2.5;
		  add: #c -> 4;
		  add: #c -> #symbol;
		  add: #c -> $a;
		  yourself
]

{ #category : #'*MultiValuedDictionary-InspectorExtensions' }
MultiValuedDictionary class >> exampleAnother [

	<sampleInstance>
	^ (self dictionary: Dictionary collection: OrderedCollection)
		  add: 1 -> #a;
		  add: 2 -> #b;
		  add: 3 -> #b;
		  add: 3 -> #c;
		  yourself
]

{ #category : #'*MultiValuedDictionary-InspectorExtensions' }
MultiValuedDictionary >> inspectionItems: aBuilder [

	<inspectorPresentationOrder: 0 title: 'Items'>
	^ aBuilder newTable
		  addColumn: (SpStringTableColumn title: 'Key' evaluated: [ :each | StObjectPrinter asTruncatedTextFrom: each key ]);
		  addColumn: (SpStringTableColumn title: 'Value' evaluated: [ :each | StObjectPrinter asTruncatedTextFrom: each value ]);
		  items: (self associations collect: [ :e | StInspectorAssociationNode hostObject: e ]);
		  yourself
]

{ #category : #'*MultiValuedDictionary-InspectorExtensions' }
MultiValuedDictionary >> inspectionKeyValues: aBuilder [

	<inspectorPresentationOrder: 2 title: 'Key->Values'>
	^ aBuilder newTable
		  addColumn: (SpStringTableColumn title: 'Key' evaluated: [ :each | StObjectPrinter asTruncatedTextFrom: each key ]);
		  addColumn: (SpStringTableColumn title: 'Value' evaluated: [ :each | StObjectPrinter asTruncatedTextFrom: each value ]);
		  items: dictionary associations;
		  yourself
]

{ #category : #'*MultiValuedDictionary-InspectorExtensions' }
MultiValuedDictionary >> inspectionKeys: aBuilder [

	<inspectorPresentationOrder: 1 title: 'Keys'>
	^ aBuilder newTable
		  addColumn: (SpStringTableColumn title: 'Key' evaluated: [ :each | StObjectPrinter asTruncatedTextFrom: each ]);
		  items: self keys;
		  yourself
]
