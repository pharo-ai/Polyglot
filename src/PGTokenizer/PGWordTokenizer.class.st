Class {
	#name : #PGWordTokenizer,
	#superclass : #PGTokenizer,
	#instVars : [
		'skipSpecial'
	],
	#category : #PGTokenizer
}

{ #category : #accessing }
PGWordTokenizer >> beSkipSpecial [
	" Set the receiver to skip special characters from the resulting tokens "

	skipSpecial := true
]

{ #category : #defaults }
PGWordTokenizer >> defaultSpecialCharset [
	" Answer a <String> with Character(s) to be considered as special for the receiver "

	^ '+\*~<>=@,%|&?!(){}[]:;."'''
]

{ #category : #initialization }
PGWordTokenizer >> initialize [
	" Private - Initialize the receiver's state to consider special word tokenizers "

	super initialize.
	self beSkipSpecial.	
]

{ #category : #accessing }
PGWordTokenizer >> isSkipSpecial [
	" Answer a <Boolean>. If <false>, special characters are added into collected tokens "

	^ skipSpecial
		ifNil: [ skipSpecial := false ]
]

{ #category : #testing }
PGWordTokenizer >> nextIsInvalid: aStream [
	" Private - Answer <true> if the next character from aStream is invalid. Skip special characters from aStream if receiver's was set to do it "

	[ aStream atEnd not and: [ self isSkipSpecial and: [ self isSpecial: aStream peek ] ] ]
		whileTrue: [ aStream skip: 1 ].
	^ aStream atEnd
]

{ #category : #tokenizing }
PGWordTokenizer >> tokenize: aDocOrString [
	" Consider a aDocOrString tokenizable by spaces. Answer a <Collection> of <String> each one a token "

	^ self wordTokenize: aDocOrString
]

{ #category : #tokenizing }
PGWordTokenizer >> wordTokenize: aString [
	" Private - Tokenize aString into wordCollection. Answer a <Collection> of <String> with tokenized words.  "

	| streamPointer cur word wordCollection |

	streamPointer := ReadStream on: aString.
	word := WriteStream on: String new.
	wordCollection := OrderedCollection new.

	[ self nextIsInvalid: streamPointer ] whileFalse: [ 
			word nextPut: (cur := streamPointer next).

			streamPointer peek isNotNil
				ifTrue: [ 
					streamPointer peek isSeparator
						ifTrue: [ 
							wordCollection add: word contents. 
							streamPointer next. 
							word := WriteStream on: String new.]].
				
			(self isSpecial: streamPointer peek)
				ifTrue: [  
					word isEmpty 
						ifFalse: [ wordCollection add: word contents ].
					self isSkipSpecial	
						ifFalse: [ wordCollection add: streamPointer next ]. 
					word := WriteStream on: String new. ].
				
			cur isSeparator
				ifTrue: [ word := WriteStream on: String new ] ] .
	word isEmpty 
		ifFalse: [ wordCollection add: word contents ].
	^ wordCollection asArray.
]
