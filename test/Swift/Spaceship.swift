//
//  Spaceship.swift
//  test
//
//  Created by Laurent on 23/10/2017.
//  Copyright © 2017 Laurent68k. All rights reserved.
//

import Foundation

struct Spaceship {
    var name: String
    
    mutating func setName(_ newName: String) {
        self.name = newName
    }
}


