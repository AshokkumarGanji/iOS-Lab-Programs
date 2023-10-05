//
//  ViewController.swift
//  ProductPriceFinder
//
//  Created by Ashok on 10/3/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        productImage.isHidden = true
    }

    
    @IBOutlet weak var productNameText: UITextField!
    
    @IBOutlet weak var discountText: UITextField!
    
    
    @IBOutlet weak var taxText: UITextField!
    
    
    @IBOutlet weak var productImage: UIImageView!
    
    
    @IBOutlet weak var priceLabel: UILabel!
    
    
    @IBAction func resetButton(_ sender: UIButton) {
        
        productNameText.text = ""
        discountText.text = ""
        taxText.text = ""
        priceLabel.text = ""
        productImage.isHidden = true
    }
    
    
    @IBAction func calculatePrice(_ sender: UIButton) {
        
        guard let productName = productNameText.text,!productName.isEmpty else
        {
            priceLabel.text = "Please enter the Product name "
            productImage.isHidden = true  // hide the image
            return
        }
        
        guard let disAmount = discountText.text, !disAmount.isEmpty, 
        let discountInputAmount = Double(disAmount)
              
        else{
            priceLabel.text = "Please enter the Discount"
            productImage.isHidden = true // hide the image
            return
        }
        
        //Tax Text Value
        guard let taxAmount = taxText.text, !taxAmount.isEmpty, 
        let taxPercentage = Double(taxAmount)
        
        else{
            
            priceLabel.text = "Please enter the Tax Amount"
            productImage.isHidden = true  // Hide the image
            return
        }
        
        let (price, imageName) = getPriceAndImage(for: productName.lowercased())
        
        
        if price == 0.0 {
                priceLabel.text = "Enter a valid product name"
                productImage.isHidden = true
                return
            }
        
        let discountedFinalPrice = calculateDiscountedPrice(originalPrice: price, discountPrice: discountInputAmount)
        
        let tax = discountedFinalPrice * (taxPercentage/100); // Calculate tax Amount
        
        let finalAmount = discountedFinalPrice + tax
        
        
        
        
        let formattedPrice = String(format: "%.2f", price)
        let formattedDiscountedPrice = String(format: "%.2f", discountedFinalPrice)
        let formattedFinalPrice = String(format: "%.2f", finalAmount)
        
        print("Original Price: \(formattedPrice)")
        print("Discounted Price: \(formattedDiscountedPrice)")
        print("Final Price: \(formattedFinalPrice)")
        
        
    
                let oneOutputText = "Original Price of \(productName) is \(formattedPrice)" + " & "+" Discounted Price: \(formattedDiscountedPrice)"
                let twoOutputText = "Final Price is : \(formattedFinalPrice)"+" 🥳🤝"
                
             //Concatenate the two strings with a newline in between
             let combinedOutputText = oneOutputText + " \n " + twoOutputText

        
        /* let outputText = """
                    Original Price: \(formattedPrice)
                    Discounted Price: \(formattedDiscountedPrice)
                    Tax Amount: \(tax)
                    Final Price with Tax: \(formattedFinalPrice)
                    """ */
        // Set the created string as the text of priceLabel
            priceLabel.numberOfLines = 0
              priceLabel.text = combinedOutputText
              

        
        
        if let image = UIImage(named: imageName){
            productImage.image = image
            productImage.isHidden = false
            
        }
        else{
            productImage.isHidden = true
        }
        
        
        //priceLabel.text = ""

        
        
    } // End of Function
    
    
    func getPriceAndImage(for productName: String) -> (Double,String){
        
        switch productName{
            
        case "laptop" :
            return(999.99, "LaptopImage")
        case "mobile" :
            return(499.99, "MobileImage")
        case "iwatch" :
            return(99.99, "IWatch")
        case "ipad" :
            return(199.99, "IPad")
        default:
            return(0.0, "")
            
        }
    }
    
    func calculateDiscountedPrice(originalPrice:Double, discountPrice:Double) -> Double
    {
        let discount = originalPrice * (discountPrice/100) ;
        return originalPrice - discount
        
    }
    
    
    
    
    
    
} // end of class

