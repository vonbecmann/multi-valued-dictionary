"
dictionary: SmallDictionary 
collection: LinkedList 

"
Class {
	#name : #SSmallDictionaryAndLinkedListTest,
	#superclass : #SimpleDictionaryTest,
	#category : #'MultiValuedDictionary-Tests'
}

{ #category : #accessing }
SSmallDictionaryAndLinkedListTest >> dictionaryClass [
	^ SmallDictionary
]

{ #category : #requirements }
SSmallDictionaryAndLinkedListTest >> valueCollectionClass [

	^ LinkedList
]
