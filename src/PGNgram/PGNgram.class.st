Class {
	#name : #PGNgram,
	#superclass : #Object,
	#instVars : [
		'history',
		'last'
	],
	#category : #PGNgram
}

{ #category : #'instance creation' }
PGNgram class >> new [
	"Either use zerogram to create an empty n-gram or provide values"
	self shouldNotImplement
]

{ #category : #'instance creation' }
PGNgram class >> withElements: aCollection [
	"Creates n-gram from a collection of n elements"
	aCollection isEmpty ifTrue: [ ^ self zerogram ].
	^ self
		withHistory: (self withElements: aCollection allButLast)
		last: aCollection last.
]

{ #category : #'instance creation' }
PGNgram class >> withHistory: aNgram last: anObject [
	"Creates n-gram with aNgram as history and anObject as last element"
	^ super new
		history: aNgram;
		last: anObject;
		yourself.
]

{ #category : #'instance creation' }
PGNgram class >> zerogram [
	"Creates n-gram of order 0. It is an empty n-gram that has no elements"
	^ super new.
]

{ #category : #comparing }
PGNgram >> = anObject [
	(anObject isKindOf: self class)
		ifFalse: [ ^ false ].
		
	^ self asArray = anObject asArray
]

{ #category : #converting }
PGNgram >> asArray [
	self isEmpty ifTrue: [ ^ #() ].
	^ history asArray copyWith: last
]

{ #category : #comparing }
PGNgram >> hash [
	^ self asArray hash
]

{ #category : #accessing }
PGNgram >> history [
	self isEmpty ifTrue: [ ^ self class zerogram ].
	^ history
]

{ #category : #'instance creation' }
PGNgram >> history: aNgram [ 
	history := aNgram
]

{ #category : #accessing }
PGNgram >> isEmpty [
	^ self last isNil
]

{ #category : #accessing }
PGNgram >> last [ 
	^ last

]

{ #category : #'instance creation' }
PGNgram >> last: anObject [
	last := anObject
]

{ #category : #accessing }
PGNgram >> order [ 
	self isEmpty ifTrue: [ ^ 0 ].
	^ history order + 1
]

{ #category : #accessing }
PGNgram >> printOn: aStream [
	aStream
		nextPutAll: 'PGn-gram';
		nextPut: $(;
		nextPutAll: (' ' join: self asArray);
		nextPut: $).
]
