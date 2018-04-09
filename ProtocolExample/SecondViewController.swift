//
//  SecondViewController.swift
//  ProtocolExample
//
//  Created by Chris Law on 4/9/18.
//

import UIKit

@objc protocol SecondViewControllerDelegate {
    // These methods have to be implemented by the class that inherits the protocol
    func myFunctionWithNoParemeters()
    func myFunctionToPassAStringBack(myString: String)
    func myFunctionToPassAStringBackButWithNoLabel(_ myString: String)
    func myFunctionToPassBothAStringAndDictionaryBack(myString: String, myDictionary: [String: Any])
    
    // These methods are optional and do no have to be written
    @objc optional func thisFunctionIsNotRequired()
    @objc optional func neitherIsThisOne( someString: String)
}

class SecondViewController: UIViewController {

    var delegate: SecondViewControllerDelegate?
    
    var propertyWellSetBeforePushingFromFirstViewController: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func noParemeterAction(_ sender: Any) {
        delegate?.myFunctionWithNoParemeters()
    }
    
    @IBAction func passStringBackAction(_ sender: Any) {
        delegate?.myFunctionToPassAStringBack(myString: "My String From SecondViewController!")
    }
    
    @IBAction func passStringNoLabelAction(_ sender: Any) {
        delegate?.myFunctionToPassAStringBackButWithNoLabel("My String From SecondViewController!")
    }
    
    @IBAction func passStringAndDictionaryAction(_ sender: Any) {
        delegate?.myFunctionToPassBothAStringAndDictionaryBack(myString: "My String From SecondViewController!", myDictionary: ["firstKey": "Dictionary from SecondViewController!"])
    }

}
