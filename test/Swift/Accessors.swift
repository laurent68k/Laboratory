//
//  Accessors.swift
//  test
//
//  Created by Laurent on 23/10/2017.
//  Copyright © 2017 Laurent68k. All rights reserved.
//

import Foundation

public class Accessors {
    
    //  Computed Properties : get only, two way to write the same
    var firstname : String {
        
        return "firstname"
    }
    
    var country : String {
    
        get {
            return "FRA"
        }
    }

    var hairColor : String {
        
        get {
            return "Brown"
        }
        
        set(myNewValue) {
            print("newvalue: \(myNewValue)")                    //  myNewValue override the default newValue
        }
    }
    
    //  Stored Properties
    var lastname : String = "lastanme value" {
        
        willSet (theNewValue ) {
            
            print("lastanme willSet : \(theNewValue)")
        }
        didSet (theNewValue ) {
            
            print("lastanme willSet : \(theNewValue)")
        }
    }
    
    private (set) var age : Int = 18

}
