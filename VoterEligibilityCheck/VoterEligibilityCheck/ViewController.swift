//
//  ViewController.swift
//  VoterEligibilityCheck
//
//  Created by Ganji,Ashok Kumar on 9/5/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var InputOL: UITextField!
    
    
    @IBOutlet weak var OutputOl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

   
    @IBAction func checkElligibility(_ sender: Any) {
        let age = Int(InputOL.text!) ?? 0
                if age >= 18
                    {
            OutputOl.text = " Your Eligible to Vote!"
            
        }
        else{
            OutputOl.text="Please enter a valid age"
        }
    }
    
}

