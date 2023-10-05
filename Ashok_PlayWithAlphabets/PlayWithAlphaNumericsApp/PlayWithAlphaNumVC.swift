//
//  ViewController.swift
//  PlayWithAlphaNumericsApp
//
//  Created by Ganji, Ashok Kumar on 9/12/23.
//

import UIKit

class PlayWithAlphaNumVC: UIViewController {

    
   
    @IBOutlet weak var headerLBL: UILabel!
    
    
    @IBOutlet weak var numberSWCH: UISwitch!
    
    
    
    @IBOutlet weak var stringSWCH: UISwitch!
    
    @IBOutlet weak var firstStrTF: UITextField!
    
    
    @IBOutlet weak var secondStrTF: UITextField!
    
    
    @IBOutlet weak var firstNumStepper: UIStepper!
    
    
    @IBOutlet weak var secondNumStepper: UIStepper!
    
    @IBOutlet weak var firstNumLBL: UILabel!
    
    @IBOutlet weak var secondNumLBL: UILabel!
    
    @IBOutlet weak var generatePattern: UIButton!
    
    
    @IBOutlet weak var manipulateString: UIButton!
    
    
    
    @IBOutlet weak var messageTV: UITextView!
    
    
    @IBOutlet weak var onReset: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        self.headerLBL.text = String(format: "%@\nPlay with AlphaNumerics™️", "\u{0c38}\u{0c4d}\u{0c35}\u{0c3e}\u{0c17}\u{0c24}\u{0c02}")
                
                generatePattern.isEnabled = false
                manipulateString.isEnabled = false
                numberSWCH.isOn = false
                stringSWCH.isOn = false
                onReset.isEnabled = true
        firstNumStepper.isEnabled = false
        secondNumStepper.isEnabled = false
    }

    
    
    // Code
    
    
    @IBAction func numberSWCH(_ sender: UISwitch) {
        if numberSWCH.isOn{
                    generatePattern.isEnabled = true
            firstNumStepper.isEnabled = true
            secondNumStepper.isEnabled = true
                }
                else{
                    generatePattern.isEnabled = false
                    firstNumStepper.isEnabled = false
                    secondNumStepper.isEnabled = false
                    firstNumLBL.text="0"
                    secondNumLBL.text="0"
                    messageTV.text = ""
                }
    }
    
    @IBAction func stringSWCH(_ sender: UISwitch) {
        
        if stringSWCH.isOn{
                    manipulateString.isEnabled = true
                }
        else{
            manipulateString.isEnabled = false
            messageTV.text = ""
            firstStrTF.text = ""
            secondStrTF.text = ""
        }
    }
    
    
    
    @IBAction func firstNumStepper(_ sender: UIStepper) {
        
        firstNumLBL.text = String(Int(sender.value))
    }
    
    
    @IBAction func secondNumStepper(_ sender: UIStepper) {
        secondNumLBL.text = String(Int(sender.value))
    }
    
    
    @IBAction func generatePattern(_ sender: UIButton) {
        
        var generatePatternSymbols = ""
                        if let numberofRows = Int(firstNumLBL.text ?? "0"),
                           let numberofColumns = Int(secondNumLBL.text ?? "0") {
                           
                            
                            for rowsPattern in 1...numberofRows {
                            for colsPattern in 1...numberofColumns {
                    
                                            if rowsPattern == 1 || rowsPattern == numberofRows  || colsPattern == 1 || colsPattern == numberofColumns  {
                                                generatePatternSymbols += "❄️"
                                            } else
                                            {
                                                if (rowsPattern % 2 == 0 && colsPattern % 2 != 0) {
                                                    generatePatternSymbols += "🎄"
                                                }
                                                else if (rowsPattern % 2 != 0 && colsPattern % 2 == 0)
                                                {
                                                    generatePatternSymbols += "🎄"
                                                }
                                                else{
                                                    generatePatternSymbols += "🎅"
                                                }
                                                
                                            }
                                        }
                                generatePatternSymbols += "\n" // Move to the next line after printing each row
                                    }
                            }
                        messageTV.text=generatePatternSymbols
    }
    
    
    @IBAction func manipulateStrings(_ sender: UIButton) {
        
        
        if let v1 = firstStrTF.text, let v2 = secondStrTF.text {
                            // Concatenate the text from both text fields
                            let concate = v1 + v2
                            var vowelcharacter=0
                            let vowelsRes: Set<Character> = Set("aeiouAEIOU")
                            for char in concate{
                                if vowelsRes.contains(char) {
                                    vowelcharacter += 1
                                        }
                                
                            }
                            let consonantcharacter = concate.count-vowelcharacter
                            var uniquecharacter = Set<Character>()
                            for k in concate {
                                uniquecharacter.insert(k)
                                }
                            var reversedcharacter = ""
                            for j in concate{
                                reversedcharacter = String(j) + reversedcharacter
                            }
                            
                    messageTV.text = "Concatenation of two strings results in \(concate) \n Number of vowels in \(concate) is \(vowelcharacter) \n Number of consonants in \(concate) is \(consonantcharacter) \n Number of unique characters in \(concate) is \(uniquecharacter.count) \n The reversal of \(concate) results in \(reversedcharacter)"
                    
                    
                        }
                        else{
                            messageTV.text="message cannot be empty"
                        }
    }
    
    
    
    @IBAction func onReset(_ sender: UIButton) {
        
        
        
             firstStrTF.text = " "
             secondStrTF.text = " "
             messageTV.text=""
             firstNumLBL.text = ""
             secondNumLBL.text = ""
        
        numberSWCH.isOn = false
        stringSWCH.isOn = false
    }
    
    
    
    
}

