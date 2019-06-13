Class {
	#name : #PGTokenizer,
	#superclass : #Object,
	#category : #PGTokenizer
}

{ #category : #testing }
PGTokenizer >> isSpecial: char [
	"Answer whether the receiver is one of the special characters"

	^'+\*~<>=@,%|&?!(){}[]:;' includes: char
]

{ #category : #'as yet unclassified' }
PGTokenizer >> sentenceTokenize: aString [
	|streamPointer cur sent sentenceCollection|
	streamPointer := ReadStream on: aString.
	sent := WriteStream on: (String new).
	sentenceCollection := OrderedCollection new.

	[ streamPointer atEnd ] whileFalse: [ 
			cur := streamPointer next.
			sent nextPut: cur.
			(( cur = $? or: cur = $!) or: (cur = $. and: streamPointer peek = $ ))
				ifTrue: [  sentenceCollection add: sent contents. sent := WriteStream on: (String new). ].
	].
	(sent isEmpty) ifFalse: [ sentenceCollection add: sent contents ].
	^sentenceCollection asArray.
]

{ #category : #parsing }
PGTokenizer >> tokenize: aDocOrString [
	|sentences|
	sentences := self sentenceTokenize: aDocOrString.
	^sentences collect: [ :each | self wordTokenize: each ]
]

{ #category : #'as yet unclassified' }
PGTokenizer >> tokenizeFlatten: aDocOrString [
	|sentences|
	sentences := self sentenceTokenize: aDocOrString.
	^ (sentences collect: [ :each | self wordTokenize: each ]) flatCollect: [ :e | e ]
]

{ #category : #'as yet unclassified' }
PGTokenizer >> wordTokenize: aString [
	|streamPointer cur word wordCollection|
	streamPointer := ReadStream on: aString.
	word := WriteStream on: (String new).
	wordCollection := OrderedCollection new.

	[ streamPointer atEnd ] whileFalse: [ 
			cur := streamPointer next.
			word nextPut: cur.
			
			(streamPointer peek isNotNil) 
				ifTrue: [(streamPointer peek isSeparator)
					ifTrue: [ wordCollection add: word contents. streamPointer next. word := WriteStream on: (String new).]].
				
			(self isSpecial: streamPointer peek)
				ifTrue: [  wordCollection add: word contents. wordCollection add: streamPointer next. word := WriteStream on: (String new). ].
				
			(cur isSeparator)
				ifTrue: [ word := WriteStream on: (String new). ].
	] .
	(word isEmpty) ifFalse: [ wordCollection add: word contents ].
	^wordCollection asArray.
]
