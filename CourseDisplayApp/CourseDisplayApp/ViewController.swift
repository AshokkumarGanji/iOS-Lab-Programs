//
//  ViewController.swift
//  CourseDisplayApp
//
//  Created by Ganji,Ashok Kumar on 9/28/23.
//

import UIKit

class ViewController: UIViewController {
    
    
    // DEclare Variables
    @IBOutlet weak var imageDisplay: UIImageView!
    
    
    
    @IBOutlet weak var crsNumber: UILabel!
    
    
    @IBOutlet weak var crsName: UILabel!
    
    
    @IBOutlet weak var SemOffered: UILabel!
    
    
    @IBOutlet weak var preBtnOL: UIButton!
    
    @IBOutlet weak var nextBtnOL: UIButton!
    
    
    // Create and Array of courses
    var courses = [["img01","44542", "Network Security", "Fall 2023"],
                   ["img02","44643", "iOS ", "Fall 2023"],
                   ["img03","44555", "Data Streaming", "Summer 2024"]]
    
    var imageNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Previous Button is disabled.
        preBtnOL.isEnabled = false
        
        //Display the Fist Couses details.
        //crsNumber.text = courses[0][1]
        //crsName.text = courses[0][2]
        //SemOffered.text = courses[0][3]
        
        //imageDisplay.image = UIImage(named: courses[0][0])
        
        updateDisplay(imageNumber)
        
    }


    // Function for Pre button clicked
    @IBAction func preBtnPressed(_ sender: Any) {
        // Next button should be enabled.
        nextBtnOL.isEnabled = true
        
        //Decreament the image number
        imageNumber -= 1
        
        //update the display using updateDisplay() function
        
        updateDisplay(imageNumber)
        //If we reach the begining of the array, previous button should be disabled
        if(imageNumber == 0){
            preBtnOL.isEnabled = false
        }
    }
    
    
    @IBAction func nextBtnPressed(_ sender: Any) {
        
        // Previous button Should be enabled
        preBtnOL.isEnabled = true
        
        // Next element in the couses array must be displayed.
        imageNumber += 1
        
        // Call the updateDiplay() method
        updateDisplay(imageNumber)
        //When we reach end of the array, Next button should be disabled.
        
        if(imageNumber == courses.count-1){
            nextBtnOL.isEnabled = false
        }
    }
    
    func updateDisplay(_ imageNumber:Int){
        
        crsNumber.text = courses[imageNumber][1]
        crsName.text = courses[imageNumber][2]
        SemOffered.text = courses[imageNumber][3]
        imageDisplay.image = UIImage(named: courses[imageNumber][0])
        
    }
    
    
    
    
    
}

