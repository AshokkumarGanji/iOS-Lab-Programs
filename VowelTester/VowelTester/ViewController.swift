//
//  ViewController.swift
//  VowelTester
//
//  Created by Ganji,Ashok Kumar on 8/31/23.
//

import UIKit

class ViewController: UIViewController {

    //Input text field
    @IBOutlet weak var InputOL: UITextField!
    
    //Out
    @IBOutlet weak var OutputOL: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    
    @IBAction func BtnClicked(_ sender: UIButton) {
        
        
        var input = InputOL.text!
        //Read the input text and Assign to the variable
        //Check if the text is having vowels or not.
        
        //if text has a, e, i, o, u then print the  "original text has vowels"
        // else, the "original text" has no vowels.
        
        
//        if(input=="a"||input=="e"||input=="i"||input=="o"||input=="u"||input=="A"||input=="E"||input=="I"||input=="O"||input=="U")
//        {
//
//
//            OutputOL.text = "The \(input) has vowels!"
//        }
//        else{
//
//            OutputOL.text = "The \(input) has no vowels!"
//        }
        
        
        if(input.contains("a")||input.contains("e")||input.contains("i")||input.contains("o")||input.contains("u")){

            OutputOL.text = "The \(input) has vowels!"
        }
        else{

            OutputOL.text = "The \(input) has no vowels"
        }
        
    }
}


