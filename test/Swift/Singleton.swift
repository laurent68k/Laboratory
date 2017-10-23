//
//  Singleton.swift
//  test
//
//  Created by Laurent on 18/10/2017.
//  Copyright © 2017 Laurent68k. All rights reserved.
//

import Foundation

public class SingletonClass {
    
    static let sharedInstance = SingletonClass()
    
    private var array : [Int] = []
    
    private (set) var name : String = "SingletonClass" {
        
        didSet(theNewValue) {
            
            print("new value is : \(theNewValue)")
        }
    }
    
    var count : Int {
        
        get {
            return self.array.count
        }
    }
    
    init() {
        
        print("I'm alive")
        
        self.array = stride(from: 0, to: 21, by: 1).map{ $0 }
        print(self.array)
    }
    deinit {
        print("I'm dead")
    }
    
    func map() {
        
        print( self.array.map{ $0 % 2 } )
        print( self.array.map{ $0 % 10} )
    }
    
    func filter() {
        
        print( self.array.filter{ $0 % 2 == 0 } )
        print( self.array.filter{ $0 % 10 == 0} )
    }
}

