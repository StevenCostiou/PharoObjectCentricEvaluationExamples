Class {
	#name : #OCEInstVarAccessProxyHandler,
	#superclass : #GHProxyHandler,
	#category : #ObjectCentricEvaluationExamples
}

{ #category : #'handle - support' }
OCEInstVarAccessProxyHandler >> handleUninstall: anInterception [
	^ anInterception proxy proxyTarget become: anInterception proxy.
]

{ #category : #'handle - support' }
OCEInstVarAccessProxyHandler >> manageMessage: interception [
	| message proxy target result |
	message := interception message.
	proxy := interception proxy.
	target := proxy proxyTarget.
	message selector == #name:
		ifTrue: [ 
			message arguments crLog.
			target tag: message arguments first ].
	result := message sendTo: target.
	^ result == target
		ifTrue: [ proxy ]
		ifFalse: [ result ]
]
