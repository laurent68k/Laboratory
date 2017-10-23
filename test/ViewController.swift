//
//  ViewController.swift
//  test
//
//  Created by Laurent on 03/10/2017.
//  Copyright © 2017 Laurent68k. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //  Test with mutating func on struct
        var enterprise = Spaceship(name: "Enterprise")
        enterprise.setName("Enterprise A")
        print(enterprise.name)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //  ----------------------------------------------------------------------------------------------------------------------------
    //  ----------------------------------------------------------------------------------------------------------------------------

    @IBAction func testCPPAction(_ sender: Any) {

        var point3D : OCPoint3D? = OCPoint3D(namePosition:"Position 1", x:10, y:20, z:30)
        
        point3D!.print("(From Swift)")
        
        point3D = nil
    }
    
    @IBAction func singletonSwiftAction(_ sender: Any) {
        
        let a1 = SingletonClass.sharedInstance
        let a2 = SingletonClass.sharedInstance
        
        print(a1.name)
        print(a2.name)
        
        a1.name = "SingletonClass changed"
        
        print(a1.name)
        print(a2.name)

        //  Others test with map(), filter()
        print(a1.count)
        print(a2.count)
        
        a1.map()
        a1.filter()
        a1.flatMap()
    }

    
    @IBAction func refCycleAction(_ sender: Any) {
     
        //  Ref Cycle: Objects are never released
        do {
            let user = User(name: "laurent")
            
            let iPhone = Phone(model: "iPhone SE")
            
            user.add(phone: iPhone)
        }
        
        //  Ref Cycle broken: Objects are correctly released
        do {
            let user = User(name: "adeline")
            
            let iPhone = PhoneWeak(model: "iPhone 6")
            
            user.add(phone: iPhone)
        }
    }
    
    
    @IBAction func testPropertiesAction(_ sender: Any) {
        
        let accessors = Accessors()
        
        print("accessors.firstname: \(accessors.firstname)")
        print("country: \(accessors.country)")
        
        print("lastname: \(accessors.lastname)")
        
         print("age: \(accessors.age)")
        
//        accessors.firstname = "new firstname"                         //  forbidden, get only
//        accessors.country = "new country"                             //  forbidden, get only
//        accessors.age = 20                                            //  forbidden, get only
        
        
        accessors.lastname = "new lastname"
    }
}

