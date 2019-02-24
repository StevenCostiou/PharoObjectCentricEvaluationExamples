"
Illustrates the instrumentation of an object with each of the following techniques:

- read only objects,
- anonymous subclasses,
- Reflectivity metalinks,
- Ghost proxies,
- and Talents.

Also illustrates instrumentation rollback.

"
Class {
	#name : #OCEInstrumenter,
	#superclass : #Object,
	#instVars : [
		'announcer'
	],
	#category : #ObjectCentricEvaluationExamples
}

{ #category : #'anonymous classes' }
OCEInstrumenter >> instrumentWithAnonymousClass: anObject [
	|anonClass|
	anonClass := anObject class newAnonymousSubclass.
	anonClass
		compile:
			'name: aName
				self tag: aName.
				name := aName'.
	anonClass adoptInstance: anObject.
	^anonClass
]

{ #category : #ghost }
OCEInstrumenter >> instrumentWithGhost: anObject [
	| proxy |
	proxy := OCETargetBasedProxy
		createProxyAndReplace: anObject
		handler: OCEInstVarAccessProxyHandler new.
	^ proxy
]

{ #category : #'read-only' }
OCEInstrumenter >> instrumentWithReadOnly: anObject [
	anObject notifyOnChange: self.
	^ self
]

{ #category : #reflectivity }
OCEInstrumenter >> instrumentWithReflectivity: anObject [
	| link |
	link := MetaLink new.
	link metaObject: #object.
	link selector: #tag:.
	link arguments: #(#newValue).
	anObject link: link toSlotNamed: #name option: #write.
	^ link
]

{ #category : #talents }
OCEInstrumenter >> instrumentWithTalent: anObject [
	|talent|
	talent := Trait new.
	talent
		compile:
			'name: aName
	self tag: aName.
	name := aName'.
	anObject addTalent: talent.
	^talent
]

{ #category : #'read-only' }
OCEInstrumenter >> objectChangeNotifiedBy: modification [
	| object |
	object := modification object.
	(object class instVarNameForIndex: modification fieldIndex) = #name
		ifFalse: [ ^ self ].
	object beWritableObject.
	object tag: modification newValue.
	object beReadOnlyObject
]

{ #category : #'anonymous classes' }
OCEInstrumenter >> removeAnonymousClassInstrumentation: anonClass from: anObject [
	anonClass superclass adoptInstance: anObject
]

{ #category : #ghost }
OCEInstrumenter >> removeGhostInstrumentation: proxy from: anObject [
	proxy uninstall
]

{ #category : #'read-only' }
OCEInstrumenter >> removeReadOnlyInstrumentationFrom: anObject [
	anObject stopNotifyOnChange: self
]

{ #category : #reflectivity }
OCEInstrumenter >> removeReflectivityInstrumentation: link from: anObject [
	link uninstall
]

{ #category : #talents }
OCEInstrumenter >> removeTalentInstrumentation: talent from: anObject [
	anObject removeTalent: talent
]
