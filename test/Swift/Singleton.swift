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
    private var multiArrays : [[Int]] = [ [], [], [] ]
    
    var name : String = "SingletonClass" {
        
        didSet(theNewValue) {
            
            print("new value is : \(theNewValue)")
        }
    }
    
    var count : Int {
        
        return self.array.count
    }
    
    private init() {
        
        print("SingletonClass Init()")
        
        self.array = stride(from: 0, to: 21, by: 1).map{ $0 }
        print("array: \(self.array)")
        
        self.multiArrays.append([Int]() )
        self.multiArrays.append([Int]() )
        self.multiArrays.append([Int]() )
        
        for index in 0..<self.multiArrays.count {
            
            self.multiArrays[index] = stride(from: 0, to: 21, by: 1).map{ $0 }
        }
        
        
        print("multiArrays: \(self.multiArrays)")

    }
    deinit {
        print("SingletonClass deinit")
    }
    
    func map() {
        
        print( "map{ $0 % 2 } : \(self.array.map{ $0 % 2 })" )
        print( "map{ $0 % 10} : \(self.array.map{ $0 % 10})" )
    }
    
    func filter() {
        
        print( self.array.filter{ $0 % 2 == 0 } )
        print( self.array.filter{ $0 % 10 == 0} )
    }
    
    func flatMap() {
        
        print( "flatMap{ $0} : \(self.multiArrays.flatMap{ $0 })" )
        print( "flatMap{ $0} : \(self.multiArrays.flatMap{ $0 })" )

        print( "flatMap{ $0.map{ $0 % 2 }} : \(self.multiArrays.flatMap{ $0.map{ $0 % 2 }})" )
        print( "flatMap{ $0.map{ $0 % 10}} : \(self.multiArrays.flatMap{ $0.map{ $0 % 10}})" )
    }
}

