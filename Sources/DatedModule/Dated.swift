//
//  Dated.swift
//  
//
//  Created by Jeremy Bannister on 10/20/22.
//

///
@_exported import Foundation

///
@dynamicMemberLookup
public struct Dated <Value> {
    
    ///
    public init
        (value: Value,
         date: Date) {
        
        self.value = value
        self.date = date
    }
    
    ///
    public var value: Value
    
    ///
    public var date: Date
    
    ///
    public subscript
        <NewValue>
        (dynamicMember keyPath: KeyPath<Value, NewValue>)
    -> NewValue {
        value[keyPath: keyPath]
    }
    
    ///
    public subscript
        <NewValue>
        (dynamicMember keyPath: WritableKeyPath<Value, NewValue>)
    -> NewValue {
        get { value[keyPath: keyPath] }
        set { value[keyPath: keyPath] = newValue }
    }
}

///
public extension Dated {
    
    ///
    func map
        <NewValue>
        (_ transform: (Value)throws->NewValue)
    rethrows -> Dated<NewValue> {
        
        ///
        try .init(
            value: transform(value),
            date: date
        )
    }
}

///
public extension Dated {
    
    ///
    static func now (_ value: Value) -> Self {
        .init(
            value: value,
            date: Date()
        )
    }
}
