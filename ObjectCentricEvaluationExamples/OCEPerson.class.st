"
Trivial model to illustrate object-centric state access instrumentation.
"
Class {
	#name : #OCEPerson,
	#superclass : #Object,
	#instVars : [
		'name',
		'tag'
	],
	#category : #ObjectCentricEvaluationExamples
}

{ #category : #accessing }
OCEPerson >> name: aName [
	name := aName
]

{ #category : #accessing }
OCEPerson >> tag [
	^tag
]

{ #category : #accessing }
OCEPerson >> tag: anObject [
	tag := anObject
]
