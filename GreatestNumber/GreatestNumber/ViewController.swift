//
//  ViewController.swift
//  GreatestNumber
//
//  Created by Ganji,Ashok Kumar on 8/31/23.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var input1OL: UITextField!
    
    @IBOutlet weak var input2OL: UITextField!
    
    
    @IBOutlet weak var outputOL: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }

    
    @IBAction func btnClicked(_ sender: UIButton) {
        
        
        let num1 = input1OL.text!
        let num2 = input2OL.text!
        
        var greatestNumber: Int
        if num1 > num2 {
            greatestNumber = num1
            
        }
        else{
            greatestNumber = num2
            
        }
        
        outputOL.text = "The number \(greatestNumber) is greatest number "
    }
    
}


