*MultiValuedDictionary-InspectorExtensions
gtInspectorItemsIn: composite
	<gtInspectorPresentationOrder: 0>
	^ composite table
		title: 'Items';
		display: [ self associations ];
		column: 'Key' evaluated: [ :each | GTObjectPrinter new asTruncatedTextFrom: each key ];
		column: 'Values'
			evaluated: [ :each | 
			| limitedString limit |
			limit := 100.
			limitedString := String
				streamContents: [ :s | each value printElementsOn: s ]
				limitedTo: limit.
			GTObjectPrinter new
				asNonTruncatedTextFrom:
					(limitedString size < limit
						ifTrue: [ limitedString ]
						ifFalse: [ limitedString , ' ...' ]) ];
		send: [ :each | each value ];
		showOnly: 50;
		yourself