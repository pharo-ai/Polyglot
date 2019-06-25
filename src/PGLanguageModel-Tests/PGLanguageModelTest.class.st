Class {
	#name : #PGLanguageModelTest,
	#superclass : #TestCase,
	#instVars : [
		'model'
	],
	#category : #'PGLanguageModel-Tests'
}

{ #category : #running }
PGLanguageModelTest >> setUp [
	super setUp.
	model := PGLanguageModel new.
]

{ #category : #tests }
PGLanguageModelTest >> testEmptyModelAssignsZeroCountToNgramOfRightOrder [
	| ngram |
	ngram := #(lorem ipsum) asPGNgram.
	self assert: (model countOfNgram: ngram) equals: 0.
]

{ #category : #tests }
PGLanguageModelTest >> testEmptyModelHasTotalNgramCount0 [
	self assert: model totalNgramCountInText equals: 0.
]

{ #category : #tests }
PGLanguageModelTest >> testEmptyModelOfOrder2HasOrder2 [
	model trainOn: 'test sentence' order: 2. 
	self assert: model order equals: 2.
]

{ #category : #tests }
PGLanguageModelTest >> testTrainedBigramModelIsProbabilityDistribution [
	| text vocab ngram sumOfProbabilities |
	text := 'Lorem ipsum dolor sit amet'.
	vocab := #('<s>' lorem ipsum dolor sit amet).
	
	model trainOn: text order: 2.
	
	vocab do: [ :firstWord |
		sumOfProbabilities := vocab inject: 0 into: [ :sum :secondWord |
			ngram := { firstWord . secondWord } asPGNgram.
			sum + (model probabilityOfNgram: ngram) ].
		
		self assert: sumOfProbabilities equals: 1 ].
]

{ #category : #tests }
PGLanguageModelTest >> testTrainedModelCounts [
	| text ngram1 ngram2 ngram3 ngram4 ngram5 |
	
	text := 'lorem ipsum ipsum ipsum dolor'.
	ngram1 := #('<s>' lorem) asPGNgram.
	ngram2 := #(lorem ipsum) asPGNgram.
	ngram3 := #(ipsum ipsum) asPGNgram.
	ngram4 := #(ipsum dolor) asPGNgram.
	ngram5 := #(dolor '<s>') asPGNgram.
	
	model trainOn: text order: 2.
	
	self assert: (model countOfNgram: ngram1) equals: 1.
	self assert: (model countOfNgram: ngram2) equals: 1.
	self assert: (model countOfNgram: ngram3) equals: 2.
	self assert: (model countOfNgram: ngram4) equals: 1.
	self assert: (model countOfNgram: ngram5) equals: 1.
]

{ #category : #tests }
PGLanguageModelTest >> testTrainedModelProbabilitiesOfNgrams [
	| text ngram1 ngram2 ngram3 ngram4 ngram5 |
	
	text := 'lorem ipsum ipsum ipsum dolor'.
	ngram1 := #('<s>' lorem) asPGNgram.
	ngram2 := #(lorem ipsum) asPGNgram.
	ngram3 := #(ipsum ipsum) asPGNgram.
	ngram4 := #(ipsum dolor) asPGNgram.
	ngram5 := #(dolor '<s>') asPGNgram.
	
	model trainOn: text order: 2.
	
	self assert: (model probabilityOfNgram: ngram1) equals: 1.
	self assert: (model probabilityOfNgram: ngram2) equals: 1.
	self assert: (model probabilityOfNgram: ngram3) equals: 2/3 asFloat.
	self assert: (model probabilityOfNgram: ngram4) equals: 1/3 asFloat.
	self assert: (model probabilityOfNgram: ngram5) equals: 1.
]

{ #category : #tests }
PGLanguageModelTest >> testTrainedModelProbabilityOfUnknownNgramWithKnownHistoryIs0 [
	| text ngram |
		
	text := 'lorem ipsum ipsum ipsum dolor'.
	ngram := #(ipsum hello) asPGNgram.
	
	model trainOn: text order: 2.
	
	self assert: (model probabilityOfNgram: ngram) equals: 0.
]

{ #category : #tests }
PGLanguageModelTest >> testTrainedModelProbabilityOfUnknownNgramWithUnknownHistoryIs0 [
	| text ngram |
	
	text := 'lorem ipsum ipsum ipsum dolor'.
	ngram := #(world hello) asPGNgram.
	
	model trainOn: text order: 2.
	
	self assert: (model probabilityOfNgram: ngram) equals: 0.
]

{ #category : #tests }
PGLanguageModelTest >> testTrainedModelSelfProbabilityOfText [
	| text |
	text := 'lorem ipsum ipsum ipsum dolor'.
	
	model trainOn: text order: 2.
	self
		assert: (model probabilityOfText: text)
		closeTo: 2/3 * 2/3 * 1/3 asFloat.
]

{ #category : #tests }
PGLanguageModelTest >> testTrainedModelSelfProbabilityOfUniformTextIs1 [
	| text |
	
	text := 'lorem ipsum dolor sit amet'.
	model trainOn: text order: 2.
	
	self assert: (model probabilityOfText: text) equals: 1.
]

{ #category : #tests }
PGLanguageModelTest >> testTrainedUnigramModelIsProbabilityDistribution [
	| text vocab ngram sumOfProbabilities |
	text := 'Lorem ipsum dolor sit amet'.
	vocab := #('<s>' lorem ipsum dolor sit amet).
	
	model trainOn: text order: 1.
	
	sumOfProbabilities := vocab inject: 0 into: [ :sum :word |
		ngram := { word } asPGNgram.
		sum + (model probabilityOfNgram: ngram).
		 ].
		
	self assert: sumOfProbabilities equals: 1.
]
