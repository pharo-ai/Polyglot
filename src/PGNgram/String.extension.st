Extension { #name : #String }

{ #category : #'*PGNgram' }
String >> asPGNgram [
	^ PGNgram withElements: { self }
]

{ #category : #'*PGNgram' }
String >> ngrams: order [
	^ self tokenizeForNgrams ngrams: order
]

{ #category : #'*PGNgram' }
String >> ngrams: order padWith: padSymbol [
	^ self tokenizeForNgrams ngrams: order padWith: padSymbol
]

{ #category : #'*PGNgram' }
String >> tokenizeForNgrams [
	|tokenizer|
	tokenizer := PGTokenizer new.
	^ tokenizer tokenizeFlatten: self.
]
