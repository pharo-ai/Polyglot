Class {
	#name : #PGLanguageModel,
	#superclass : #Object,
	#instVars : [
		'trainData',
		'historyCounts',
		'ngramCounts',
		'order'
	],
	#category : #PGLanguageModel
}

{ #category : #'as yet unclassified' }
PGLanguageModel >> buildVocab [
	^ trainData asBag.
]

{ #category : #'as yet unclassified' }
PGLanguageModel >> countOfHistory: anNgramHistory [
	^ historyCounts occurrencesOf: anNgramHistory
]

{ #category : #'as yet unclassified' }
PGLanguageModel >> countOfNgram: anNgram [
	^ ngramCounts occurrencesOf: anNgram
]

{ #category : #'as yet unclassified' }
PGLanguageModel >> countOfUniqueNgramsEndingWith: aWord [
	^ (ngramCounts asSet select: [ :ngram | ngram last = aWord ]) size
]

{ #category : #'as yet unclassified' }
PGLanguageModel >> countOfUniqueNgramsWithHistory: ngram [
	^ (ngramCounts asSet
		select: [ :eachNgram | eachNgram history = ngram ]) size.
]

{ #category : #accessing }
PGLanguageModel >> historyCounts [
	^historyCounts
]

{ #category : #initialization }
PGLanguageModel >> initialize [ 
	super initialize.
	ngramCounts := Bag new.
	historyCounts := Bag new.
]

{ #category : #accessing }
PGLanguageModel >> ngramCounts [
	^ngramCounts
]

{ #category : #accessing }
PGLanguageModel >> order [ 
	^order
]

{ #category : #'as yet unclassified' }
PGLanguageModel >> predictNextWord: anNgramHistory [
	| ngramsWithHistory topOne |
	ngramsWithHistory := ngramCounts select: [ :ngram | ngram history = anNgramHistory  ].
	topOne := ngramsWithHistory sortedCounts first value.
	^ topOne last
]

{ #category : #'as yet unclassified' }
PGLanguageModel >> predictNextWord: history top: aNumber [
	| ngramsWithHistory lo topOnes |
	ngramsWithHistory := ngramCounts select: [ :ngram | ngram history = history ].
	ngramsWithHistory := ngramsWithHistory sortedCounts.
	lo := (ngramsWithHistory size - aNumber + 1) max: 1.
	topOnes := (ngramsWithHistory copyFrom: lo to: ngramsWithHistory size) collect: #value.
	^ topOnes collect: #last
]

{ #category : #'as yet unclassified' }
PGLanguageModel >> probabilityOfNgram: ngram [
	"Probability of n-gram is a conditional probability of its last word w given the history h (n-gram of order n-1): P(w|h)"
	|histCount ngramCount|
	ngramCount := self countOfNgram: ngram.
	histCount := self countOfHistory: ngram history.
	
	(ngramCount = 0)
		ifTrue: [ ^ 0 ].
	
	^ (ngramCount / histCount) asFloat.
]

{ #category : #'as yet unclassified' }
PGLanguageModel >> probabilityOfText: anArrayOfWords [
	| ngrams |
	ngrams := (anArrayOfWords collect: [ :token | token asLowercase ]) ngrams: order.
	^(ngrams collect: [ :ngram | self probabilityOfNgram: ngram.])
		inject: 1 into: [ :prod :each | prod * each ].

]

{ #category : #'as yet unclassified' }
PGLanguageModel >> topNgrams: order [
	| ngramsCollection |
	ngramsCollection := (trainData ngrams: order) asBag sortedCounts.
	^ ngramsCollection
]

{ #category : #'as yet unclassified' }
PGLanguageModel >> topNgrams: order k: count [
	| ngramsCollection |
	ngramsCollection := (trainData ngrams: order) asBag sortedCounts.
	^ (1 to: count) collect: [ :index | ngramsCollection at: index ] 
]

{ #category : #accessing }
PGLanguageModel >> totalNgramCountInText [
	^ ngramCounts size
]

{ #category : #accessing }
PGLanguageModel >> trainData [
	^trainData 
]

{ #category : #'as yet unclassified' }
PGLanguageModel >> trainOn: anArrayOfTokens order: value [
	| trainNgrams |
	
	order := value.
	trainData := anArrayOfTokens collect: [ :token | token asLowercase ].
	trainNgrams := trainData ngramsWithDefaultPadding: value.
	
	"trainNgrams do: [ :each | ngramCounts add: each ]."
	ngramCounts := trainNgrams asBag.
	
	ngramCounts doWithOccurrences: [ :ngram :count |
		historyCounts add: ngram history withOccurrences: count ].
	
	^trainNgrams 
]
