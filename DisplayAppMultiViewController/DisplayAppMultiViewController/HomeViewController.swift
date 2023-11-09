//
//  ViewController.swift
//  DisplayAppMultiViewController
//
//  Created by Ashok on 10/31/23.
//

import UIKit

class HomeViewController: UIViewController {

    
    @IBOutlet weak var amountOL: UITextField!
    
    @IBOutlet weak var discountRateOL: UITextField!
    
    
    var priceAfterDiscount = 0.0
    
    var imageName = ""
    
    @IBAction func calcBtn(_ sender: UIButton) {
        
        var amount = Double(amountOL.text!)
        var discountRate = Double(discountRateOL.text!)
        
        priceAfterDiscount = amount! - (amount!*discountRate!/100)
        
        if(discountRate! > 0.0){
            
            imageName = "discount"
            
        }
        else{
            
            imageName = "no-discount"
        }
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
        var transition = segue.identifier
        if transition == "ResultSegue" {
            
            var destination = segue.destination as! ResultViewController
            
            destination.amount = amountOL.text!
            destination.discRate = discountRateOL.text!
            
            destination.priceAfterDiscount = priceAfterDiscount
            
            destination.image = imageName
            
        }
        
            
            
    }
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

