//
//  ResultViewController.swift
//  DisplayAppMultiViewController
//
//  Created by Ashok on 10/31/23.
//

import UIKit

class ResultViewController: UIViewController {
    
    
    
    var amount = ""
    var discRate = ""
    var priceAfterDiscount = 0.0
    
    var image = ""
    
    @IBOutlet weak var displayAmountOL: UILabel!
    
    @IBOutlet weak var displayDiscountRate: UILabel!
    
    @IBOutlet weak var displayPriceAfterDisOL: UILabel!
    
    
    @IBOutlet weak var displayImageOL: UIImageView!
    
    
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        displayAmountOL.text! += amount
        displayDiscountRate.text! += discRate
        displayPriceAfterDisOL.text! += String(priceAfterDiscount)
        displayImageOL.image = UIImage(named: image)
        
        
    }
    
   
    
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
