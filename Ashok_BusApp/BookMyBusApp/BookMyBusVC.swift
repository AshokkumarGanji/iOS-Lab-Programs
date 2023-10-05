//
//  ViewController.swift
//  BookMyBusApp
//
//  Created by Chandra on 9/17/23.
//

import UIKit

class BookMyBusVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        messageLBL.text="Hello! Please fill in your details"
        confirmBTN.isEnabled=false
        cancelBTN.isEnabled=false
        titleLBL.text=String(format: "\u{0c2a}\u{0c32}\u{0c4d}\u{0c32}\u{0c46}\u{0c35}\u{0c46}\u{0c32}\u{0c41}\u{0c17}\u{0c41}🚍")
        busSeatingIMG.image=UIImage(named: "busseating")
    }

    @IBOutlet weak var titleLBL: UILabel!
    @IBOutlet weak var nameTF: UITextField!
    
    @IBOutlet weak var noOfAdultsLBL: UILabel!
    
    @IBAction func firstStepper(_ sender: UIStepper) {
        noOfAdultsLBL.text=Int(sender.value).description
    }
    
    @IBOutlet weak var noOfChildrenLBL: UILabel!
    
    @IBAction func secondStepper(_ sender: UIStepper) {
        noOfChildrenLBL.text=Int(sender.value).description
    }
    
    @IBAction func onSeaterBtnClick(_ sender: UIButton) {
        busSeatingIMG.image=UIImage(named: "seaterbus")
        confirmBTN.isEnabled=true
        cancelBTN.isEnabled=true
    }
    
    @IBOutlet weak var seaterBTN: UIButton!
    
    @IBAction func onSleeperBtnClick(_ sender: UIButton) {
        busSeatingIMG.image=UIImage(named: "sleeperbus")
        confirmBTN.isEnabled=true
        cancelBTN.isEnabled=true
    }
    
    @IBOutlet weak var sleeperBTN: UIButton!
    
    
    @IBOutlet weak var busSeatingIMG: UIImageView!
    
    @IBOutlet weak var messageLBL: UILabel!
    
    @IBAction func onConfirmBooking(_ sender: UIButton) {
        guard let customername=nameTF.text,!customername.isEmpty else {messageLBL.text="Please fill in the name field"
            return
        }
        
        guard let adultsno=noOfAdultsLBL.text,let adultscount=Int(adultsno) else{
            return
        }
        guard let childrenno=noOfChildrenLBL.text,let childrencount=Int(childrenno) else{
            return
        }
        var cost: Int
        if sleeperBTN.isEnabled{
            cost = (adultscount*400)+(childrencount*200)
        }
        else{
            cost=(adultscount*400)+(childrencount*200)
        }
        
        messageLBL.text="Thankyou, \(customername)! for booking your bus tickets with us. Your total for \(adultscount+childrencount) is $\(cost)"
        
        let alertController = UIAlertController(title: "Success✅", message: "Your tickets are confirmed 🎊", preferredStyle: .alert)

        // Create an action for the alert (e.g., "OK" button)
        let okAction = UIAlertAction(title: "OK", style: .default) { (_) in
            // Handle the "OK" button tap if needed
            print("OK button tapped")
        }

        // Add the action to the alert controller
        alertController.addAction(okAction)

        // Present the alert controller
        present(alertController, animated: true, completion: nil)
        confirmBTN.isEnabled=false
    }
    
    @IBOutlet weak var confirmBTN: UIButton!
    
    
    @IBAction func onCancelBooking(_ sender: UIButton) {
        nameTF.text=""
        
        busSeatingIMG.image=UIImage(named: "busseating")
        noOfAdultsLBL.text="0"
        noOfChildrenLBL.text="0"
    }
    
    @IBOutlet weak var cancelBTN: UIButton!
    
}

