Extension { #name : #SequenceableCollection }

{ #category : #'*PGNgram' }
SequenceableCollection >> asPGNgram [
	^ PGNgram withElements: self
]

{ #category : #'*PGNgram' }
SequenceableCollection >> bigrams [ 
	^ self ngrams: 2
]

{ #category : #'*PGNgram' }
SequenceableCollection >> bigramsPadWith: padSymbol [
	^ self ngrams: 2 padWith: padSymbol
]

{ #category : #'*PGNgram' }
SequenceableCollection >> bigramsWithDefaultPadding [
	^ self ngramsWithDefaultPadding: 2
]

{ #category : #'*PGNgram' }
SequenceableCollection >> defaultNgramPadding [
	^ '<s>'
]

{ #category : #'*PGNgram' }
SequenceableCollection >> ngrams: order [
	^ (1 to: self size - order + 1) collect: [ :i |
		(self copyFrom: i to: i + order - 1) asPGNgram ]
]

{ #category : #'*PGNgram' }
SequenceableCollection >> ngrams: order padWith: padSymbol [
	| elements |
	elements := self asOrderedCollection.
	
	(order - 1) timesRepeat: [
		elements addFirst: padSymbol.
		elements addLast: padSymbol ].
	
	^ elements ngrams: order.
]

{ #category : #'*PGNgram' }
SequenceableCollection >> ngramsWithDefaultPadding: order [
	^ self ngrams: order padWith: self defaultNgramPadding.
]

{ #category : #'*PGNgram' }
SequenceableCollection >> pentagrams [ 
	^ self ngrams: 5
]

{ #category : #'*PGNgram' }
SequenceableCollection >> pentagramsPadWith: padSymbol [
	^ self ngrams: 5 padWith: padSymbol
]

{ #category : #'*PGNgram' }
SequenceableCollection >> pentagramsWithDefaultPadding [
	^ self ngramsWithDefaultPadding: 5
]

{ #category : #'*PGNgram' }
SequenceableCollection >> tetragrams [ 
	^ self ngrams: 4
]

{ #category : #'*PGNgram' }
SequenceableCollection >> tetragramsPadWith: padSymbol [
	^ self ngrams: 4 padWith: padSymbol
]

{ #category : #'*PGNgram' }
SequenceableCollection >> tetragramsWithDefaultPadding [
	^ self ngramsWithDefaultPadding: 4
]

{ #category : #'*PGNgram' }
SequenceableCollection >> trigrams [ 
	^ self ngrams: 3
]

{ #category : #'*PGNgram' }
SequenceableCollection >> trigramsPadWith: padSymbol [
	^ self ngrams: 3 padWith: padSymbol
]

{ #category : #'*PGNgram' }
SequenceableCollection >> trigramsWithDefaultPadding [
	^ self ngramsWithDefaultPadding: 3
]

{ #category : #'*PGNgram' }
SequenceableCollection >> unigrams [ 
	^ self ngrams: 1
]

{ #category : #'*PGNgram' }
SequenceableCollection >> unigramsPadWith: padSymbol [
	^ self ngrams: 1 padWith: padSymbol
]

{ #category : #'*PGNgram' }
SequenceableCollection >> unigramsWithDefaultPadding [
	^ self ngramsWithDefaultPadding: 1
]
