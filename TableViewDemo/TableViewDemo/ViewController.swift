//
//  ViewController.swift
//  TableViewDemo
//
//  Created by Ashok on 11/9/23.
//

import UIKit

class product{
    
    var name: String?
    var category: String?
    
    init(name: String, category: String) {
        self.name = name
        self.category = category
    }
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //Returns the number of product.
        return productArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //Create the cell
        var cell = tableViewOutlet.dequeueReusableCell(withIdentifier: "reusableCell", for: indexPath)

        //populate the cell
        cell.textLabel?.text = productArray[indexPath.row].name
        
        // Return the Cell
        return cell
        
    }
    

    @IBOutlet weak var tableViewOutlet: UITableView!
    
    var productArray = [product]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let product1 = product(name: "MacBookAir", category: "Laptop")
        let product2 = product(name: "Airpods", category: "Accessories")
        let product3 = product(name: "Iphone", category: "mobile")
        let product4 = product(name: "Iwatch", category: "Accessories")
        let product5 = product(name: "charger", category: "Accessories")
        
        productArray.append(product1)
        productArray.append(product2)
        productArray.append(product3)
        productArray.append(product4)
        productArray.append(product5)
        
        
        tableViewOutlet.delegate = self
        tableViewOutlet.dataSource = self
        
        
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let transition = segue.identifier
        if (transition == "productDetails"){
            
            let destination = segue.destination as!
            productDescriptionViewController
            destination.product = productArray[(tableViewOutlet.indexPathForSelectedRow?.row)!]
            
        }
    }

}

