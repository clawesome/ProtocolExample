//
//  ViewController.swift
//  ProtocolExample
//
//  Created by Chris Law on 4/9/18.
//

import UIKit

class ViewController: UIViewController, SecondViewControllerDelegate {
    
    func myFunctionWithNoParemeters() {
        print("myFunctionWithNoParemeters ran")
    }
    
    func myFunctionToPassAStringBack(myString: String) {
        print("myString: \(myString)")
    }
    
    func myFunctionToPassAStringBackButWithNoLabel(_ myString: String) {
        print("myString: \(myString) (no label func)")
    }
    
    func myFunctionToPassBothAStringAndDictionaryBack(myString: String, myDictionary: [String : Any]) {
        print("myString: \(myString), myDictionary: \(myDictionary)")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    @IBAction func showSecondControllerProgramatically(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        if let secondController = storyboard.instantiateViewController(withIdentifier: "SecondViewControllerStoryboardId") as? SecondViewController {
            secondController.delegate = self
            secondController.propertyWellSetBeforePushingFromFirstViewController = "Set from the first view controller with programatic instantiation!"
            secondController.view.backgroundColor = .blue
            self.navigationController?.pushViewController(secondController, animated: true)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? SecondViewController {
            vc.delegate = self
            vc.propertyWellSetBeforePushingFromFirstViewController = "Set from prepare for storyboard!"
            vc.view.backgroundColor = .red
        }
        // Can use segue identifier to make sure we need that speficic segue and destination controller if needed,
        // in this case we only have one segue with 'SecondViewController' as the destination so no real need
        // to use the identifier here.
        /*
        if segue.identifier == "ShowSecondControllerSegue" {
            if let vc = segue.destination as? SecondViewController {
                vc.propertyWellSetBeforePushingFromFirstViewController = "Set from prepare for storyboard!"
            }
        }*/
    }

}

