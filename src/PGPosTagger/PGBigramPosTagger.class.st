Class {
	#name : #PGBigramPosTagger,
	#superclass : #Object,
	#instVars : [
		'trainData',
		'trainTokens',
		'hiddenStates'
	],
	#category : #PGPosTagger
}

{ #category : #'as yet unclassified' }
PGBigramPosTagger >> computeEmissionProbabilities [ 
	|countOfTags countOfWordGivenTags probabilityOfWordGivenTag|
	countOfTags := hiddenStates asBag.
	countOfWordGivenTags := trainData asBag.
	
	probabilityOfWordGivenTag := Dictionary new.
	
	countOfWordGivenTags do: [ :each | probabilityOfWordGivenTag at: each put: (countOfWordGivenTags occurrencesOf: each) / (countOfTags occurrencesOf: (each at: 2) ) ].
	
 	^probabilityOfWordGivenTag 
]

{ #category : #'as yet unclassified' }
PGBigramPosTagger >> computeTransitionProbabilities [
	|transitionProbabilities nHiddenStateCount historyHiddenStateCount|
	transitionProbabilities := Dictionary new.
	
	nHiddenStateCount := (self ngrams: 2 elements: hiddenStates padWith: '<s>' ) asBag.
	historyHiddenStateCount := (self ngrams: 1 elements: hiddenStates padWith: '<s>' ) asBag.
	
	nHiddenStateCount do: [ :each | transitionProbabilities at: each put: ((nHiddenStateCount occurrencesOf: each) / (historyHiddenStateCount occurrencesOf: each history)) ].
	
	^nHiddenStateCount
]

{ #category : #'as yet unclassified' }
PGBigramPosTagger >> ngrams: value elements: aCollection padWith: padSymbol [
	| elements |
	elements := aCollection asOrderedCollection.
	
	(2 - 2) timesRepeat: [
		elements addFirst: padSymbol.
		elements addLast: padSymbol ].
	
	^ elements ngrams: value.
]

{ #category : #'as yet unclassified' }
PGBigramPosTagger >> trainOn: anArrayOfArrays [
	
	trainData := anArrayOfArrays.
	trainTokens := anArrayOfArrays collect: [ :array | (array at: 1) asLowercase ].
	hiddenStates := anArrayOfArrays collect: [ :array | (array at: 2) ].
]
