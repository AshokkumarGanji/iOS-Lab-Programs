//
//  ViewController.swift
//  DiscountApp
//
//  Created by Ashok on 9/25/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //Code from here
    
    
    @IBOutlet weak var amountOL: UITextField!
    
    @IBOutlet weak var discount: UITextField!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    
    @IBAction func CalculateAmount(_ sender: UIButton) {
        
        guard let amountText = amountOL.text,
              let discountText = discount.text,
              let amountPrice = Double(amountText),
              let discountPercentage = Double(discountText) else{
            totalLabel.text="Invalid input"
            return
        }
        
        if discountPercentage < 0 || discountPercentage > 100{
            
            totalLabel.text = "Discount percentage should be between 0 and 100"
            return
        }
            
            let discountAmount = amountPrice * (discountPercentage/100)
            let discountedPrice = amountPrice-discountAmount
        
        
        totalLabel.text = String(format: "Total Amount: $%.2f", discountedPrice)
            
            
            
            
            
    }
    
    

}// End of Main

