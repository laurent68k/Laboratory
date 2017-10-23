//
//  Generic.swift
//  test
//
//  Created by Laurent on 23/10/2017.
//  Copyright © 2017 Laurent68k. All rights reserved.
//

import Foundation

class GenericsFcts {
    
    func swapValues<T>( _ left:inout T, with right:inout T ) {
        
        let tmp : T  = left
        left = right
        right = tmp
    }
}
