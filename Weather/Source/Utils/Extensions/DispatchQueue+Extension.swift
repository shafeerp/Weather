//
//  DispatchQueue+Extension.swift
//  Weather
//
//  Created by Shafeer Puthalan on 20.03.23.
//

import Foundation

protocol Dispatching: AnyObject {
    func async(block: @escaping () -> Void)
}

extension DispatchQueue: Dispatching {
    func async(block: @escaping () -> Void) {
        async(group: nil, execute: block)
    }
}
