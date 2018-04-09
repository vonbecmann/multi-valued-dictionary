"
dictionary: Dictionary 
collection: OrderedCollection 

"
Class {
	#name : #SDictionaryAndOrderedCollectionTest,
	#superclass : #SimpleDictionaryTest,
	#category : 'MultiValuedDictionary-Tests'
}

{ #category : #accessing }
SDictionaryAndOrderedCollectionTest >> dictionaryClass [
	^ Dictionary
]

{ #category : #accessing }
SDictionaryAndOrderedCollectionTest >> valueCollectionClass [
	^ OrderedCollection
]
