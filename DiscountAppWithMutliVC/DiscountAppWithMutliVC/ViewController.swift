//
//  ViewController.swift
//  DiscountAppWithMutliVC
//
//  Created by Ganji,Ashok Kumar on 10/31/23.
//

import UIKit

class ViewController: UIViewController {

    
    
    
    @IBOutlet weak var amountOL: UITextField!
    
    
    
    @IBOutlet weak var disountOL: UITextField!
    
    
    var priceAfterDisount = 0.0
     
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    
    @IBAction func calcBtn(_ sender: UIButton) {
        
        
        var amount = Double(amountOL.text!)
        
        var dicountRate = Double(disountOL.text!)
        
        
        
        priceAfterDisount = amount! - (amount! * dicountRate!/100)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        var transition = segue.identifier
        
        if transition == "resultSegue"{
            
            var destination = segue.destination as! ResultViewController
            
            destination.amount = amountOL.text!
            destination.discRate = disountOL.text!
            
            destination.priceAfterDiscount = priceAfterDisount
        }
        
        
    }
    
    

}

