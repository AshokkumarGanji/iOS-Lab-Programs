//
//  ViewController.swift
//  ImageDisplayApp
//
//  Created by Ashok on 10/4/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBOutlet weak var playerName: UITextField!
    
    
    @IBOutlet weak var getImageOL: UIButton!
    
    
    @IBOutlet weak var textLabel: UILabel!
    
    
    @IBOutlet weak var imageViewOL: UIImageView!
    
    
    @IBAction func getImageAction(_ sender: UIButton) {
        
        guard let player = playerName.text, !player.isEmpty else{
            
            textLabel.text = "Enter the Player Name "
            imageViewOL.image = nil
           
            return
        }
        
        // create a dictionary to map players name to image
        let playersImagesMap: [String: String] = ["yuvraj": "YuvrajSingh",
                                                 "dhoni": "Dhoni",
                                                 "sachin": "Sachin",
                                                 "raina": "Raina",
                                                 "rohit sharma": "RohitSharma",
                                                 "kohli": "Kohli"
                                                 ]
        
        
        if let imageName = playersImagesMap[player.lowercased()]{
            
            textLabel.text = player + "🏏🏆 2011"
            imageViewOL.image = UIImage(named: imageName)
            
        } else {
            textLabel.text = "Player not found"
            imageViewOL.image = nil // Clear the image view
        }
     
    } // End of Action
        
} // End of class

