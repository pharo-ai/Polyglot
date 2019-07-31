Class {
	#name : #PGPosTaggerTest,
	#superclass : #TestCase,
	#instVars : [
		'tagger'
	],
	#category : #PGPosTaggerTests
}

{ #category : #running }
PGPosTaggerTest >> setUp [
	|trainData|
	trainData := #( #('my' 'pron') #('head' 'noun') #('is' 'verb') #('blowing' 'verb') #('the' 'det') #('my' 'pron') #('head' 'noun') #('is' 'noun') #('is' 'noun')). 
	tagger := PGPosTagger new.
	tagger trainOn: trainData order: 3.
]

{ #category : #tests }
PGPosTaggerTest >> testComputeTransitionProbabilities [
	|expected result|
	result := tagger computeTransitionProbabilities.
]
