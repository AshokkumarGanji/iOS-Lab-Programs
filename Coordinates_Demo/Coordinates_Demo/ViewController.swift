//
//  ViewController.swift
//  Coordinates_Demo
//
//  Created by Ganji,Ashok Kumar on 10/17/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        print("Min values")
        let minX = imageOL.frame.minX
        let minY = imageOL.frame.minY
        
        print(minX, ", ", minY)
        
        print("Max values")
        let maxX = imageOL.frame.maxX
        let maxY = imageOL.frame.maxY
        
        print(maxX, ", ", maxY)
        
        print("Mid values")
        let midX = imageOL.frame.midX
        let midY = imageOL.frame.midY
        
        print(midX, ", ", midY)
        
        
        //Display the image at the top left corner of the view.
        
        imageOL.frame.origin.x = 0
        imageOL.frame.origin.x = 0
       
        
        //Display the image at the top right corner of the view.
        
        imageOL.frame.origin.x = 314
        imageOL.frame.origin.x = 0
        
        //Display the image at the buttom right corner of the view.
        
        imageOL.frame.origin.x = 314
        imageOL.frame.origin.x = 796
        
        //Display the image at the buttom left corner of the view.
        
        imageOL.frame.origin.x = 0
        imageOL.frame.origin.x = 796
        
        
        //Display the image at the center of the view.
        
        //(314/2-50, 896/2-50)
        imageOL.frame.origin.x = 157
        imageOL.frame.origin.x = 448
        
    }


    @IBOutlet weak var imageOL: UIImageView!
    
    
    
    
}

