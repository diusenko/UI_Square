//
//  Generator.swift
//  Square
//
//  Created by Usenko Dmitry on 1/2/19.
//  Copyright © 2019 Usenko Dmitry. All rights reserved.
//

import Foundation

final class InfiniteSecuenceGenerator<Value> {
    
    private let values: [Value]
    private let index = Atomic(0)
    
    init(_ values: [Value]) {
        self.values = values
    }
    
    convenience init(_ values: Value...) {
        self.init(values)
    }
    
    func next() -> Value {
        let index:Int = self.index.modify { index in
            
            defer {
                index = (index + 1) % self.values.count
            }
            
            return index
        }
        
        return values[index]
    }
}
