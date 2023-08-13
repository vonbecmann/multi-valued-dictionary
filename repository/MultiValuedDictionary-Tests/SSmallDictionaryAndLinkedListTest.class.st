"
dictionary: SmallDictionary 
collection: LinkedList 

"
Class {
	#name : #SSmallDictionaryAndLinkedListTest,
	#superclass : #SimpleDictionaryTest,
	#category : #'MultiValuedDictionary-Tests'
}

{ #category : #requirements }
SSmallDictionaryAndLinkedListTest >> dictionaryClass [
	^ SmallDictionary
]

{ #category : #requirements }
SSmallDictionaryAndLinkedListTest >> valueCollectionClass [

	^ LinkedList
]
