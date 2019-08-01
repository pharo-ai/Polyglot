Class {
	#name : #ManhattanDistanceTest,
	#superclass : #TestCase,
	#category : #'PGMetrics-Tests'
}

{ #category : #tests }
ManhattanDistanceTest >> testManhattanDistance [
	| result actual |
	
	result := #(10 20 10) manhattanDistance: #(10 20 20).
	actual := 10.
	self assert: (result closeTo: actual). 
]
