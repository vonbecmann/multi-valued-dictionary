Class {
	#name : #BaselineOfMultiValuedDictionary,
	#superclass : #BaselineOf,
	#category : #BaselineOfMultiValuedDictionary
}

{ #category : #baselines }
BaselineOfMultiValuedDictionary >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ 
			spec
				package: 'MultiValuedDictionary-Core';
				package: 'MultiValuedDictionary-InspectorExtensions'
					with: [ spec requires: #('MultiValuedDictionary-Core') ];
				package: 'MultiValuedDictionary-Tests'
					with: [ spec requires: #('MultiValuedDictionary-Core') ].
			spec
				group: 'default'
					with:
					#(	'MultiValuedDictionary-Core' 
						'MultiValuedDictionary-InspectorExtensions' 
						'MultiValuedDictionary-Tests');
				group: 'Core' with: #('MultiValuedDictionary-Core');
				group: 'Tests' with: #('MultiValuedDictionary-Tests') ]
]
