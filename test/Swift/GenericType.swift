//
//  GenericType.swift
//  test
//
//  Created by Laurent on 23/10/2017.
//  Copyright © 2017 Laurent68k. All rights reserved.
//

import Foundation

class Stack<Element> {
    
    private var array = [Element]()
    
    init() {
        
    }
    deinit {
        
    }
    
    func push(_ value:Element) {
     
        self.array.append(value)
    }
    
    func pop() -> Element? {
        
        if self.array.count > 0 {
        
            return self.array.removeLast()
        }
        return nil
    }
    
    func display() {
        
        print("\(self.array)")
    }
}

extension Stack {
 
    var topItem: Element? {
    
        return self.array.last
    }
    
    var bottomItem: Element? {
        
        return self.array.first
    }
}
