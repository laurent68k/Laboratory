//
//  ViewController.swift
//  test
//
//  Created by Laurent on 03/10/2017.
//  Copyright © 2017 Laurent68k. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController {

    var activityIndicator : UIActivityIndicatorView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.test004()
        self.addActivityIndicator()
    }
    
    
    override func viewDidLayoutSubviews() {
        
        super.viewDidLayoutSubviews()
        
        
    }
    
    /**
        Add programmaticaly an UIActivityIndicatorView
     */
    private func addActivityIndicator() {
     
        //  If not already created
        if self.activityIndicator == nil {
            
            self.activityIndicator = UIActivityIndicatorView()
            //  Unwrap to manipulate easily
            if let activityIndicator = self.activityIndicator {
                
                //  Set my preferrences
                activityIndicator.activityIndicatorViewStyle = .whiteLarge
                activityIndicator.hidesWhenStopped = true
                activityIndicator.translatesAutoresizingMaskIntoConstraints = false
                
                self.view.addSubview(activityIndicator)
                
                //  finally add the constraints for the UI
                let horizontalConstraint = NSLayoutConstraint(item: activityIndicator, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: self.view, attribute: NSLayoutAttribute.centerX, multiplier: 1, constant: 0)
                
                let verticalConstraint = NSLayoutConstraint(item: activityIndicator, attribute: NSLayoutAttribute.centerY, relatedBy: NSLayoutRelation.equal, toItem: self.view, attribute: NSLayoutAttribute.centerY, multiplier: 1, constant: 0)
                
                self.view.addConstraint(horizontalConstraint)
                self.view.addConstraint(verticalConstraint)
            }
        }
    }
    
    let disposeBag = DisposeBag()
    
    @IBAction func activityAction(_ sender: Any) {
        
        if let activity = self.activityIndicator {
            
            if activity.isAnimating {
                
                activity.stopAnimating()
            }
            else {
                
                activity.startAnimating()
            }
        }
    }
    
    func test2() {
    
        let myVarObservable = Variable<Int>(0)
        
        for i in 1...3 {
        
            myVarObservable.value = i
        }
        
        myVarObservable.asObservable().subscribe({
            
            value in
            
            print("value:\(value)")
            
        }).disposed(by: self.disposeBag)

        for i in 4...6 {
            
            myVarObservable.value = i
        }
    }
    
    func test1() {
        
        //  Test with mutating func on struct
        var enterprise = Spaceship(name: "Enterprise")
        enterprise.setName("Enterprise A")
        print(enterprise.name)
        
        let numbers = [1, 2, 3].flatMap { [$0, $0] }
        print("\(numbers)")
        
        let numbers3 = [[1], [2], [3]].flatMap { [$0, $0] }
        print("\(numbers3)")

        let numbers2 = [1, 2, 3].map { [$0, $0] }
        print("\(numbers2)")

        let numbers4 = [[1], [2], [3]].map { [$0, $0] }
        print("\(numbers4)")
        
        let array = [1, 3, 5, 7, 9]
        let result1 = array.reduce(0, +)
        print("\(result1)")
        
        let i = 10
        let correct = 9...11 ~= i
        print("\(correct)")
        
        let names = ["River", "Kaylee", "Zoe"]
        let result2 = names.sorted { $0 > $1 }
        print(result2)
        
        let result3 = UInt8.max.addingReportingOverflow(1)
    }

    func test03() {
        
        let entier = 4
        
        switch entier {
            
        case    1:
            break
        case    2:
            break
            
        default:
            break
            
        }
    }
    
    func test004() {
        
        var myDico = [Int:String]()
        
        myDico[1] = "Un"
        
        myDico[2] = "Deux"
        
        print("\(myDico.count)")
        
        myDico.removeValue(forKey: 2)

        print("\(myDico.count)")
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
        
        //let a3 = SingletonClass()
        
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
    
    @IBAction func testGenericsAction(_ sender: Any) {
        
        let generics = GenericsFcts()
        
        var leftInt = 10
        var rightInt = 20
        
        print("left= \(leftInt) right=\(rightInt)")
        generics.swapValues(&leftInt, with: &rightInt)
        print("left= \(leftInt) right=\(rightInt)")
        
        
        var left = "left"
        var right = "right"
        
        print("left= \(left) right=\(right)")
        generics.swapValues(&left, with: &right)
        print("left= \(left) right=\(right)")
        
        
        
        let stack = Stack<Int>()
        
        stack.push(10)
        stack.push(20)
        stack.push(30)
        
        stack.display()

        print("\(String(describing: stack.pop()))")
        print("\(String(describing: stack.pop()))")
        print("\(String(describing: stack.pop()))")

        print("\(String(describing: stack.pop()))")
    }

}

