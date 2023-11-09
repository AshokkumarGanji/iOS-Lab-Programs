//
//  ResultViewController.swift
//  WeightCalcApp
//
//  Created by Ashok on 11/2/23.
//

import UIKit

class ResultViewController: UIViewController {

    
    @IBOutlet weak var displayedWeightOL: UILabel!
    
    @IBOutlet weak var displayedHeightOL: UILabel!
    
    @IBOutlet weak var displayedBMIOL: UILabel!
    
   
    @IBOutlet weak var displayedImageOL: UIImageView!
    
    
    var weight = ""
    var height = ""
    var bmi = 0.0
    var image = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        displayedWeightOL.text! += weight
        displayedHeightOL.text! += height
        displayedBMIOL.text! += String(bmi)
        displayedImageOL.image = UIImage(named: image)

        // Do any additional setup after loading the view.
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
