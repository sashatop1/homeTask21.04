import UIKit

class GameViewController: UIViewController {
    
    lazy var game = Memory(numberOfPairsOfCrads: (cardButtons.count + 1) / 2)
    
    
    @IBOutlet weak var tapCounterLabel: UILabel!
    @IBOutlet var cardButtons: [UIButton]!
    
    var emojiList = ["🦊", "🐻", "🐼", "🐨", "🦁", "🐯", "🐵", "🦉", "🦇"]
    var emoji = [Int:String]()
    var emojiForCards: [String]!
    var tapCounter = 0
    lazy var alert: UIAlertController = {
        let alert = UIAlertController(title: "Nice", message: "Do you want to restart game?", preferredStyle: .alert)
        let continueAnction = UIAlertAction(title: "Yes", style: .default, handler: { [weak self] (action) in
            self?.restartButton(UIButton())
        })
        let cancelAction = UIAlertAction(title: "No", style: .cancel, handler: nil)
        alert.addAction(continueAnction)
        alert.addAction(cancelAction)
        return alert
    }()
    
    
    override func viewDidLoad() {
        tapCounterLabel.text = String(tapCounter)
        
    }
    
    @IBAction func cardButtonAction(_ sender: UIButton) {
        if let cardIndex = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardIndex)
            updateButtons()
            tapCounter += 1
            tapCounterLabel.text = String(tapCounter)
        } else {
            print("This button is not in card buttons!")
        }
    }
    
    func emoji(for card: Card) -> String {
        if emoji[card.id] == nil, emojiList.count > 0 {
            let randomIndex = Int.random(in: 0..<emojiList.count)
            emoji[card.id] = emojiList.remove(at: randomIndex)
        }
        
        return emoji[card.id] ?? "?"
    }
    
    @IBAction func restartButton(_ sender: Any) {
        newGame()
        tapCounter = 0
        tapCounterLabel.text = String(tapCounter)
    }
    
    func showCard(_ button: UIButton, _ card: Card) {
        if button.backgroundColor !=  #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1) {
            button.setTitle(emoji(for: card), for: .normal)
            button.backgroundColor = #colorLiteral(red: 0.2723996043, green: 0.6819463372, blue: 0.632582128, alpha: 1)
        }
    }
    
    func newGame() {
        emojiForCards = emojiList
        game = Memory(numberOfPairsOfCrads: (cardButtons.count + 1) / 2)
        updateButtons()
    }
    
    func endOfGame() {
        if game.allCardsHaveBeenMatched {
            DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(700)) {
                self.present(self.alert, animated: true, completion: nil)
                }
            let counts = Counts(counts: tapCounter + 1)
            TapManager.addCounts(object: counts)
            print(TapManager.allObjects())
        }
    }
    
    
    func updateButtons() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            }
            else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 0.2723996043, green: 0.6819463372, blue: 0.632582128, alpha: 1)
            }
        }
        
        endOfGame()
        
    }
    
}

