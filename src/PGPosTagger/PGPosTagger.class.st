Class {
	#name : #PGPosTagger,
	#superclass : #Object,
	#instVars : [
		'trainData',
		'order',
		'hiddenStates',
		'trainTokens'
	],
	#category : #PGPosTagger
}

{ #category : #'as yet unclassified' }
PGPosTagger >> computeTransitionProbabilities [
	|transitionProbabilities nHiddenStateCount historyHiddenStateCount|
	transitionProbabilities := Dictionary new.
	
	nHiddenStateCount := (self ngrams: order elements: hiddenStates padWith: '<s>' ) asBag.
	historyHiddenStateCount := (self ngrams: order-1 elements: hiddenStates padWith: '<s>' ) asBag.
	
	nHiddenStateCount do: [ :each | transitionProbabilities at: each put: ((nHiddenStateCount occurrencesOf: each) / (historyHiddenStateCount occurrencesOf: each history)) ].
	
	^transitionProbabilities
]

{ #category : #'as yet unclassified' }
PGPosTagger >> ngrams: value elements: aCollection padWith: padSymbol [
	| elements |
	elements := aCollection asOrderedCollection.
	
	(order - 2) timesRepeat: [
		elements addFirst: padSymbol.
		elements addLast: padSymbol ].
	
	^ elements ngrams: value.
]

{ #category : #'as yet unclassified' }
PGPosTagger >> trainOn: anArrayOfArrays order: value [
	||
	
	order := value.
	trainData := anArrayOfArrays.
	trainTokens := anArrayOfArrays collect: [ :array | (array at: 1) asLowercase ].
	hiddenStates := anArrayOfArrays collect: [ :array | (array at: 2) ].
]
