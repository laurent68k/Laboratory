//
//  ViewController.swift
//  test
//
//  Created by Laurent on 03/10/2017.
//  Copyright © 2017 Laurent68k. All rights reserved.
//

import UIKit

class truc {
    
    var maVariable : String = "" {
        didSet {
            
        }
    }
}



class ViewController: UIViewController {

    weak var toto : truc?
    
    
    struct Spaceship {
        var name: String
        
        mutating func setName(_ newName: String) {
            self.name = newName
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        
        let a1 = SingletonClass.sharedInstance
        let a2 = SingletonClass.sharedInstance
        
        print(a1.name)
        print(a2.name)
        
        print(a1.count)
        print(a2.count)
        
        a1.map()
        a1.filter()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.

        var enterprise = Spaceship(name: "Enterprise")
        enterprise.setName("Enterprise A")
        print(enterprise.name)
        
        
        self.toto = truc()
    }

    //  ----------------------------------------------------------------------------------------------------------------------------
    //  ----------------------------------------------------------------------------------------------------------------------------

    @IBAction func testCPPAction(_ sender: Any) {

        var point3D : OCPoint3D? = OCPoint3D(namePosition:"Position 1", x:10, y:20, z:30)
        
        point3D!.print("(From Swift)")
        
        point3D = nil
    }
    

}

