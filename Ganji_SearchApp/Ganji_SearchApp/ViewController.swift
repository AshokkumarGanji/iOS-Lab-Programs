//
//  ViewController.swift
//  Ganji_SearchApp
//
//  Created by saidi reddy cheemalamarri on 10/28/23.
//

import UIKit

class ViewController: UIViewController {

    
    var actors = [
        ["actor1", "Rajinikanth, born Shivaji Rao Gaekwad on December 12, 1950, is one of the most iconic actors in Indian cinema. He is known for his work in Tamil cinema and has appeared in numerous successful films, including Baashha, Sivaji, Endhiran, and Kabali."],
        ["actor2", "Kamal Haasan, born on November 7, 1954, is a versatile Indian actor known for his work in Tamil and Indian cinema. He has acted in films like Nayagan, Indian, Hey Ram, and Vishwaroopam."],
        ["actor3", "Amitabh Bachchan is a legendary Indian actor who has appeared in numerous Hindi films. He was born on October 11, 1942. Some of his notable films include Sholay, Deewar, Zanjeer, and Piku."],
        ["actor4", "Aamir Khan, born on March 14, 1965, is a renowned actor, director, and producer in Indian cinema. He has acted in films such as Lagaan, Dil Chahta Hai, 3 Idiots, and Dangal."],
        ["actor5", "Shah Rukh Khan, also known as the 'King of Bollywood,' was born on November 2, 1965. He has appeared in popular Hindi films like Dilwale Dulhania Le Jayenge, My Name Is Khan, Chennai Express, and Raees."]
    ]
                  //
                var animals = [
                    ["animal1", "The Bengal Tiger is one of the most majestic and endangered species of tigers found in the Indian subcontinent. Known for its distinct orange coat and black stripes, the Bengal Tiger is a symbol of strength and grace."],
                    ["animal2", "The African Elephant is the largest land animal on Earth. These gentle giants are known for their intelligence and strong family bonds. They are native to various regions in Africa."],
                    ["animal3", "The Red Fox is a cunning and adaptable animal known for its beautiful red fur. It is found in a variety of habitats, including forests, grasslands, and urban areas."],
                    ["animal4", "The Giant Panda is an iconic bear species native to China. Known for its distinctive black and white markings, the Giant Panda is a symbol of conservation efforts."],
                    ["animal5", "The African Lion is often referred to as the 'King of the Jungle.' These majestic predators are known for their social structure and hunting prowess."],
                ]
        
        
        
    
    
    var cricketers = [
        ["cricketer1", "Sachin Tendulkar, often referred to as the 'God of Cricket,' is a legendary Indian cricketer. He is known for his impeccable batting skills and numerous records in international cricket."],
        ["cricketer2", "Sir Don Bradman is widely considered one of the greatest cricketers in history. The Australian batsman had an exceptional career and an astonishing Test batting average of 99.94."],
        ["cricketer3", "Muttiah Muralitharan is a Sri Lankan cricketer known for his extraordinary spin bowling. He holds the record for the most wickets taken in international cricket."],
        ["cricketer4", "Wasim Akram, the 'Sultan of Swing,' is a former Pakistani cricketer known for his incredible fast bowling skills. He is regarded as one of the finest pacers in the history of cricket."],
        ["cricketer5", "Ellyse Perry is an Australian female cricketer who excels in both batting and fast bowling. She has made significant contributions to women's cricket and is a prominent all-rounder."]
    ]

    var actors_keywords = ["actors", "film stars", "superstars", "cinema artists"]
    var animals_keywords = ["wildlife", "animal", "creatures", "mammal"]
    var cricketers_keywords = ["cricketers", "sportsmen", "athletes", "batsmen"]
    
    
    var currentImageIndex = 0
    var currentTopicIndex = 0
        
    
    let welcomeImage = UIImage(named: "welcome")
    let searchNotFoundImage = UIImage(named: "NotFound")
    
    @IBOutlet weak var searchTextField: UITextField!
    
    
    
    @IBOutlet weak var searchButtonOL: UIButton!
    
    
    @IBAction func searchButtonAction(_ sender: UIButton) {
        
        
        ShowPrevImagesBtn.isHidden = false
        ShowNextImagesBtn.isHidden = false
        ResetButtonOL.isHidden = false
        
        guard let searchTextValue = searchTextField.text?.lowercased() else {
            return
        }
                
        if actors_keywords.contains(searchTextValue){
            
            currentTopicIndex = 1
        } else if animals_keywords.contains(searchTextValue){
            currentTopicIndex = 2
        } else if cricketers_keywords.contains(searchTextValue){
            currentTopicIndex = 3
        } else {
            
            //show search not found image
            currentTopicIndex = 0
            resultImage.image = searchNotFoundImage
            topicInfoText.text = "No results found for '\(searchTextValue)"
            
            // Disable Next and Prev buttons
                    searchButtonOL.isEnabled = false
                    return
                    }
        currentImageIndex = 0
        
        showCurrentImages()
        // Enable searchButton and disable Prev button on search
            searchButtonOL.isEnabled = true
            ShowPrevImagesBtn.isEnabled = false
            updateNextButtonState()
                
    }
    
    
    @IBOutlet weak var resultImage: UIImageView!
    
    @IBAction func ShowPrevImagesBtn(_ sender: UIButton) {
        
        if currentImageIndex > 0 {
            currentImageIndex -= 1
            showCurrentImages()
            
            updateNextButtonState()
                }
        
        
    }
    
    
    @IBAction func ResetBtn(_ sender: UIButton) {
        
        currentTopicIndex = 0
        currentImageIndex = 0
        searchTextField.text = ""
        searchButtonOL.isEnabled = false
        resultImage.image = welcomeImage
        topicInfoText.text = ""
        hideButtons()
        
    }
    
    
    
    @IBAction func ShowNextImagesBtn(_ sender: UIButton) {
        
        let maxImages = getImagesForCurrentTopic().count
                if currentImageIndex < maxImages - 1 {
                    currentImageIndex += 1
                    showCurrentImages()
                    
                    updatePrevButtonState()
                    updateNextButtonState()
                }
        
        
    }
    
    
    
    @IBOutlet weak var topicInfoText: UITextField!
    
    
    @IBAction func textEnteredAction(_ sender: UITextField) {
        
        
        if let text = searchTextField.text, !text.isEmpty{
            searchButtonOL.isEnabled = true
        } else{
            searchButtonOL.isEnabled = false
        }
    }
    
    // Previous and Next buttons Ooutlets
    
    
    @IBOutlet weak var ShowPrevImagesBtn: UIButton!
    
    
    @IBOutlet weak var ShowNextImagesBtn: UIButton!
    
    
    @IBOutlet weak var ResetButtonOL: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        resultImage.image = UIImage(named: "welcome")
        searchButtonOL.isEnabled = false
        
        
        hideButtons()
    }

    func showCurrentImages(){
        
        let images = getImagesForCurrentTopic()
        let currentImageName = images[currentImageIndex][0]
        let currrentImageDescription = images[currentImageIndex][1]
        resultImage.image = UIImage(named: currentImageName)
        topicInfoText.text = currrentImageDescription
    }
    
    func getImagesForCurrentTopic() -> [[String]]
    {
        switch currentTopicIndex{
        case 1:
            return actors
        case 2:
            return animals
        case 3:
            return cricketers
        default :
            return []
        }
    }
    
    
    
    // Helper function to update the state of the Next button
    func updateNextButtonState() {
        let images = getImagesForCurrentTopic()
        let maxImages = images.count
        if currentImageIndex >= maxImages - 1 {
            ShowNextImagesBtn.isEnabled = false
        } else {
            ShowNextImagesBtn.isEnabled = true
        }
    }

    // Helper function to update the state of the Prev button
    func updatePrevButtonState() {
        if currentImageIndex <= 0 {
            ShowPrevImagesBtn.isEnabled = false
        } else {
            ShowPrevImagesBtn.isEnabled = true
        }
        
    }
    
    func hideButtons(){
        ShowPrevImagesBtn.isHidden = true
        ShowNextImagesBtn.isHidden = true
        ResetButtonOL.isHidden = true
    }
    func enableButtons(){
        ShowPrevImagesBtn.isEnabled = true
        ShowNextImagesBtn.isEnabled = true
        ResetButtonOL.isEnabled = true
    }

} // End of main

