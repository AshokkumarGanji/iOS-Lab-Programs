//
//  ViewController.swift
//  Palavelli_WordGuess
//
//  Created by Palavelli,Anil Kumar on 3/27/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var wordsGuessedLabel: UILabel!
    
    @IBOutlet weak var wordsRemainingLabel: UILabel!
    
    @IBOutlet weak var totalWordsLabel: UILabel!
    
    @IBOutlet weak var userGuessLabel: UILabel!
    
    @IBOutlet weak var guessLetterField: UITextField!
    
    @IBOutlet weak var hintLabel: UILabel!
    
    @IBOutlet weak var guessCountLabel: UILabel!
    
    @IBOutlet weak var statusLabel: UILabel!
    
    
    
    @IBOutlet weak var guessLetterButton: UIButton!
    
    
    @IBOutlet weak var playAgainButton: UIButton!
    
    
    @IBOutlet weak var displayImage: UIImageView!
    
    var words=[["APPLE","Fruit","apple"],["TOMATO","Vegetable","tomato"],["ROSE","Flower","rose"],["DAIRYMILK","Choclate","diarymilk"],["ROHIT","Cricketer","rohit"]]
    
    var noOfGuesses = 0
    var countnum = 0;
    var wordguesses = ""
    var lettersGuessed = ""
    var countnumChanged = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        wordsGuessedLabel.text! += "0"
        wordsRemainingLabel.text! += "5"
        totalWordsLabel.text! += "5"
        //guess letter  button should be disabled.
        guessLetterButton.isEnabled = false;
        //Get the first word from the array
        wordguesses = words[countnum][0]
        
        userGuessLabel.text = ""
        
        //Populate the display label with the underGuessLabel. The # of underGuessLabel is equal to the # of characters in the word.
        updateGuesslabels();
        
        //Get the first hint from the array
        hintLabel.text = "Hint: "+words[countnum][1]
        
        //Clear the status label intially.
        statusLabel.text = ""
    }
    
    
    @IBAction func guessLetterButtonPressed(_ sender: UIButton) {
        if(noOfGuesses != 10){
                    noOfGuesses+=1
                    guessCountLabel.text="You have made \(noOfGuesses) guesses"
                    var letter = guessLetterField.text!
                    
                    //Replace the guessed letter if the letter is part of the word.
                    lettersGuessed = lettersGuessed + letter
                     var displayedWord = ""
                    for a in wordguesses{
                        if lettersGuessed.contains(a){
                            displayedWord += "\(a)"
                        }
                        else{
                            displayedWord += "_ "
                        }
                    }
                    //Assigning the word to displaylabel after a guess
                    userGuessLabel.text = displayedWord
                    guessLetterField.text = ""
                    
                    //If the word is guessed correctly, we are enabling play again button and disabling the check button.
                    if userGuessLabel.text!.contains("_") == false{
                        playAgainButton.isHidden = false;
                        displayImage.image=UIImage(named: words[countnum][2])
                        guessLetterButton.isEnabled = false;
                        guessCountLabel.text="Wow! You have made \(noOfGuesses) guesses to guess the word!"
                        wordsGuessedLabel.text="Total number of words guessed successfully : \(countnum+1)"
                        wordsRemainingLabel.text="Total number of words remaining in game : \(words.count-(countnum+1))"
                        
                    }
                    guessLetterButton.isEnabled = false
                    countnumChanged=true
                }else{
                    hintLabel.text=""
                    playAgainButton.isHidden=false
                    guessCountLabel.text="You have used all the available guesses, Please play Again"
                    countnumChanged=false
                }
    }
    
    
    
    @IBAction func playAgainButtonPressed(_ sender: UIButton) {
        ///Reset the button to disable initially.
        
        if(countnumChanged){
            countnum += 1
        }else{
            
        }
        guessLetterField.text=""
        playAgainButton.isHidden = true
        displayImage.image=UIImage()
        guessLetterButton.isEnabled=false
        noOfGuesses=0
        guessCountLabel.text="You have made \(noOfGuesses) guesses"
        //clear the label
        lettersGuessed = ""
        
        //if count reaches the end of the array (all the words are guessed sucessfully), then print Congratualtions in the status label.
        if countnum+1 == words.count+1{
            guessCountLabel.text=""
            displayImage.image=UIImage(named: "done")
            statusLabel.text = "Congruations! You are done with the game!"
            //clearing the labels.
            userGuessLabel.text = ""
            hintLabel.text = ""
        }
        else{
            //fetch the next word from the array
            wordguesses = words[countnum][0]
            //fetch the hint related to the word
            hintLabel.text = "Hint: "+words[countnum][1]
            //Enabling the check button.
            guessLetterButton.isEnabled = true
            
            userGuessLabel.text = ""
            updateGuesslabels()
        }
    }
    
    @IBAction func enterLetterChanged(_ sender: UITextField) {
        //Read the data from the text field
        var textEnterd = guessLetterField.text!;
        //Consider only the last character by calling textEntered.last and trimming the white spaces.
        textEnterd = String(textEnterd.last ?? " ").trimmingCharacters(in: .whitespaces)
        guessLetterField.text = textEnterd
        
        //Check whether the entered text is empty or not to enable check button.
        if textEnterd.isEmpty{
            guessLetterButton.isEnabled = false
        }
        else{
            guessLetterButton.isEnabled = true
        }
    }
    
    func updateGuesslabels(){
        for letter in wordguesses{
            userGuessLabel.text! += "_ "
        }
    }
    

}

