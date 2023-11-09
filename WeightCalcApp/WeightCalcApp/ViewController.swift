//
//  ViewController.swift
//  WeightCalcApp
//
//  Created by Ashok on 11/2/23.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var weightOL: UITextField!
    
    
    @IBOutlet weak var heightOL: UITextField!
    
    var bmi = 0.0
    var imageName = ""
    var weight = 0.0
    var height = 0.0
    
    //before change
    @IBAction func calcBMI(_ sender: UIButton) {
        
        weight = Double(weightOL.text!) ?? 0.0;
        height = Double(heightOL.text!) ?? 0.0;
            
        bmi = (weight/(height*height)) * 730.0
            
                    if bmi < 18.5 {
                        imageName = "underWeightImage"
                    } else if bmi < 24.9 {
                        imageName = "normalWeightImage"
                    } else if bmi < 34.9 {
                        imageName = "goodWeightImage"
                    } else {
                        imageName = "overWeightImage"
                    }
//                    performSegue(withIdentifier: "ResultSegue", sender: nil)
                
        
        
        
    } // end of calcBMI
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ResultSegue" {
                    if let destination = segue.destination as? ResultViewController {
                        destination.weight = weightOL.text!
                        destination.height = heightOL.text!
                        destination.bmi = bmi
                        destination.image = imageName
                    }
                }
        }
        
   /* private func calculateBMI(height: Double, weight: Double) -> Double {
            bmi = Double(weight / ((height / 100) * (height / 100)))
        return (bmi * 100).rounded() / 100  // Round to two decimal places

        } */
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

