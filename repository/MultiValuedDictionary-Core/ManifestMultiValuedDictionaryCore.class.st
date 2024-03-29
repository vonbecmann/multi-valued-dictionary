"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestMultiValuedDictionaryCore,
	#superclass : #PackageManifest,
	#category : #'MultiValuedDictionary-Core-Manifest'
}

{ #category : #'code-critics' }
ManifestMultiValuedDictionaryCore class >> ruleCollectionProtocolRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#MultiValuedDictionary #collect: #false)) #'2016-06-28T15:42:24.938187-03:00') #(#(#RGMethodDefinition #(#MultiValuedDictionary #reject: #false)) #'2016-06-28T15:42:24.938368-03:00') #(#(#RGMethodDefinition #(#MultiValuedDictionary #select: #false)) #'2016-06-28T15:42:24.938544-03:00') #(#(#RGMethodDefinition #(#MultiValuedDictionary #associationsSelect: #false)) #'2021-06-24T23:55:53.079106-03:00') )
]

{ #category : #'code-critics' }
ManifestMultiValuedDictionaryCore class >> ruleRBOverridesDeprecatedMethodRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#MultiValuedDictionary #asOrderedCollection #false)) #'2023-08-28T20:51:59.399697-03:00') #(#(#RGMethodDefinition #(#ArrayMultiValuedDictionary #asOrderedCollection #false)) #'2023-08-28T20:51:59.399869-03:00') )
]

{ #category : #'code-critics' }
ManifestMultiValuedDictionaryCore class >> ruleUnaryAccessingMethodWithoutReturnRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#MultiValuedDictionary #anyOne #false)) #'2016-09-03T19:25:05.773327-03:00') #(#(#RGMethodDefinition #(#ArrayMultiValuedDictionary #anyOne #false)) #'2016-09-03T19:25:05.77317-03:00') )
]
