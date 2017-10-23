//
//  RefCycle.swift
//  test
//
//  From: https://www.raywenderlich.com/134411/arc-memory-management-swift
//  Created by Laurent on 23/10/2017.
//  Copyright © 2017 Laurent68k. All rights reserved.
//

import Foundation

class Phone {
    
    let model: String
    var owner: User?
    
    init(model: String) {
        self.model = model
        print("Phone \(model) is initialized")
    }
    
    deinit {
        print("Phone \(model) is being deallocated")
    }
}

class PhoneWeak : Phone {
    
    weak var ownerWeak: User?
    
}

class User {
    var name: String
    private(set) var phone: Phone?

    init(name: String) {
        self.name = name
        print("User \(name) is initialized")
    }
    
    deinit {
        print("User \(name) is being deallocated")
    }
    
    func add(phone: Phone) {
        
        self.phone = phone
        
        if phone is PhoneWeak {
            
            (phone as! PhoneWeak).ownerWeak = self                      //  Becarful ! Cycle reference potential
        }
        else {
            
            phone.owner = self                                          //  Becarful ! Cycle reference
        }
    }
}

