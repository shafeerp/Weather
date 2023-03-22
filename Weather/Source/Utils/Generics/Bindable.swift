//
//  Bindable.swift
//  Weather
//
//  Created by Shafeer Puthalan on 20.03.23.
//

/// Generic form of Closure for binding purpose
class Bindable<T> {
    
    var value : T? {
        didSet {
            observer?(value)
        }
    }
    var observer : ((T?) -> ())?
    
    func bind(observer : @escaping (T?) -> ()) {
        self.observer = observer
    }
}

