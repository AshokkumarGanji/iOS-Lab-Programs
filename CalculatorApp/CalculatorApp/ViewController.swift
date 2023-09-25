//
//  ViewController.swift
//  CalculatorApp
//
//  Created by Ashok on 9/23/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //Declare variables
        var currentInput = ""
        var currentOperator: String?
        var previousInput = ""
    
    @IBOutlet weak var resultOutlet: UILabel!
    
  
    // Action method for AC button
    @IBAction func clearAllButtonPressed(_ sender: UIButton) {
        
        clearCalculator()
               
    }
    
        // Action method for C button
    @IBAction func clearButtonPressed(_ sender: UIButton) {
                
        clearCurrentInput()
    }
    
    // Action method for +/- button
    @IBAction func signChangeButton(_ sender: UIButton) {
        
        toggleSign()
    }
    
    // Action methods for arithmetic operations
    @IBAction func divideButtonPressed(_ sender: UIButton) {
        
        operatorAction("/")
    }
    
    
    @IBAction func multiplyButtonPressed(_ sender: UIButton) {
        operatorAction("*")
    }
    
    
    
    @IBAction func substractButtonPressed(_ sender: UIButton) {
        operatorAction("-")
    }
    
    
    @IBAction func addButtonPressed(_ sender: UIButton) {
        operatorAction("+")
    }
    
    
    @IBAction func equalsButtonPressed(_ sender: UIButton) {
        
        calculationOperation()
    }
    
    // Action method for % (modulo) button
    @IBAction func moduloButtonPressed(_ sender: UIButton) {
        
        operatorAction("%")
    }
   
    // Action method for decimal point button
    @IBAction func decimalButtonPressed(_ sender: UIButton) {
        
        appendDecimalPoint()
        
//        if !currentInput.contains("."){
//            currentInput += "."
//            resultOutlet.text = currentInput
//        }
        
    }
    
   
    //Number buttons functions
    @IBAction func sevenButtonPressed(_ sender: UIButton) {
        
        if let digit = sender.titleLabel?.text {
            currentInput += digit
            resultOutlet.text = currentInput
        }
    }
    
    @IBAction func eightButtonPressed(_ sender: UIButton) {
        
        if let digit = sender.titleLabel?.text {
            currentInput += digit
            resultOutlet.text = currentInput
        }
    }
    
    
    @IBAction func nineButtonPressed(_ sender: UIButton) {
        if let digit = sender.titleLabel?.text {
            currentInput += digit
            resultOutlet.text = currentInput
        }
    }
    
    
    @IBAction func fourButtonPressed(_ sender: UIButton) {
        
        if let digit = sender.titleLabel?.text {
            currentInput += digit
            resultOutlet.text = currentInput
        }
    }
    
    @IBAction func fiveButtonPressed(_ sender: UIButton) {
        
        if let digit = sender.titleLabel?.text {
            currentInput += digit
            resultOutlet.text = currentInput
            
        }
    }
    
    
    @IBAction func sixButtonPressed(_ sender: UIButton) {
        
        if let digit = sender.titleLabel?.text {
            currentInput += digit
            resultOutlet.text = currentInput
        }
    }
    
    @IBAction func oneButtonPressed(_ sender: UIButton) {
        
        if let digit = sender.titleLabel?.text {
            currentInput += digit
            resultOutlet.text = currentInput
        }
    }
    
   
    @IBAction func twoButtonPressed(_ sender: UIButton) {
        
        if let digit = sender.titleLabel?.text {
            currentInput += digit
            resultOutlet.text = currentInput
        }
    }
    
 
    @IBAction func threeButtonPressed(_ sender: UIButton) {
        if let digit = sender.titleLabel?.text {
            currentInput += digit
            resultOutlet.text = currentInput
        }
    }
    
    
    @IBAction func zeroButtonPressed(_ sender: UIButton) {
        
        if let digit = sender.titleLabel?.text {
            currentInput += digit
            resultOutlet.text = currentInput
        }
    }
    
    // Function to clear the calculator
        func clearCalculator() {
            currentInput = ""
            currentOperator = nil
            previousInput = ""
            resultOutlet.text = ""
        }
    
    // Function to clear the current input
        func clearCurrentInput() {
            currentInput = ""
            resultOutlet.text = ""
        }
    
    // Function to toggle the sign of the current input
        func toggleSign() {
            if !currentInput.isEmpty {
                if currentInput.first == "-" {
                    currentInput.removeFirst()
                } else {
                    currentInput = "-" + currentInput
                }
                resultOutlet.text = currentInput
            }
        }
    
    // Function to append a decimal point to the current input
        func appendDecimalPoint() {
            if !currentInput.contains(".") {
                currentInput += "."
                resultOutlet.text = currentInput
            }
        }
    
    // Function to handle arithmetic operator button presses
    func operatorAction(_ operatorSymbol: String) {
            if !currentInput.isEmpty {
                currentOperator = operatorSymbol
                previousInput = currentInput
                currentInput = ""
                resultOutlet.text = ""
            }
        }
    
    // Function to perform the calculation
    func calculationOperation() {
           if let operatorSymbol = currentOperator, !currentInput.isEmpty {
               
               let oprd1 = Double(previousInput) ?? 0.0
               let oprd2 = Double(currentInput) ?? 0.0
               var resultValue: Double = 0.0
               
               switch operatorSymbol {
               case "+":
                   resultValue = oprd1 + oprd2
               case "-":
                   resultValue = oprd1 - oprd2
               case "*":
                   resultValue = oprd1 * oprd2
               case "/":
                   if oprd2 != 0 {
                       resultValue = oprd1 / oprd2
                   } else {
                       resultOutlet.text = "Not a valid  Number "
                       return
                   }
               case "%":
                   if oprd2 != 0 {
                       resultValue = oprd1.truncatingRemainder(dividingBy: oprd2)
                   } else {
                       resultOutlet.text = "Error"
                       return
                   }
               default:
                   break
               }
               
               currentInput = String(resultValue)
               currentOperator = nil
               previousInput = currentInput
               resultOutlet.text = currentInput
           }
       }
    
    
}//End of main

