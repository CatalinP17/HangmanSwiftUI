import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var displayWordLabel: UILabel!
    @IBOutlet weak var wrongLetters: UILabel!
    @IBOutlet weak var guessTextField: UITextField!
    
    @IBOutlet weak var gameImage: UIImageView!
    @IBOutlet weak var hangmanImage: UIImageView!
    
    var wordArray = ["RHYTHM", "LUNATIC", "JUICE"]
    
    var word = ""
    
    var wrongLettersArray = [Character]()
    
    var usedLetters = [Character]()
    
    var displayWordArray = [Character]()
    
    var displayWord = ""
    
    var guess: Character!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        word = wordArray.randomElement()!
        
        usedLetters = Array(word)
        
        for i in 1...word.count {
            
            displayWord += "?"
            
            displayWordLabel.text = displayWord
            displayWordArray = Array(displayWord)
        }
        
    }

    @IBAction func guessButton(_ sender: UIButton) {
        guessTextField.resignFirstResponder()
        
        let guess1 = guessTextField.text
        
        if guess1 == "" {
            guessTextField.placeholder = "Enter a letter"
        } else if guess1!.count > 1 {
            guessTextField.placeholder = "Enter one letter"
        } else {
            guess = Character(guessTextField.text!.capitalized)
            checkForLetter()
            displayWord = String(displayWordArray)
            displayWordLabel.text = displayWord
            guessTextField.text = ""
            checkForWin()
        }
        
    }
    
    @IBAction func resetButton(_ sender: UIButton) {
        guessTextField.text = ""
        hangmanImage.image = UIImage(contentsOfFile: "")
        gameImage.image = UIImage(contentsOfFile: "")
        wrongLettersArray = []
        wrongLetters.text = ""
        displayWord = ""
        
        word = wordArray.randomElement()!
        usedLetters = Array(word)
        
        for letters in 1...word.count {
            displayWord += "?"
            displayWordLabel.text = displayWord
            displayWordArray = Array(displayWord)
        }
        
    }
    
    func checkForLetter() {
        if usedLetters.contains(guess) {
            for i in 0...word.count - 1 {
                if guess == usedLetters[i] {
                    displayWordArray[i] = guess
                }
            }
            
        } else {
            wrongLettersArray.append(guess)
            wrongLetters.text = String(wrongLettersArray)
            
            placeImage()
        }
    }
    
    func placeImage() {
        let p1 = UIImage(named: "pic1")
        let p2 = UIImage(named: "pic2")
        let p3 = UIImage(named: "pic3")
        let p4 = UIImage(named: "pic4")
        let p5 = UIImage(named: "pic5")
        let p6 = UIImage(named: "pic6")
        let p7 = UIImage(named: "pic7")
        let p8 = UIImage(named: "pic8")
        
        let imageArray = [p1, p2, p3, p4, p5, p6, p7, p8]
        
        hangmanImage.image = imageArray[wrongLettersArray.count-1]
    }
    
    func checkForWin() {
        if wrongLettersArray.count == 8 {
            gameImage.image = UIImage(named: "gameOver")
            
        } else if displayWord.contains("?") {
            
        } else {
            gameImage.image = UIImage(named: "youWin")
            
        }
    }
    
    
}

