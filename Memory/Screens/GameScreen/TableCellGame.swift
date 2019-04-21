import UIKit

class TableCellGame: UITableViewCell {
    static let identifier = "tableCell"
    
    let gameVC = GameViewController()
    
    @IBOutlet weak var clickCountsLabel: UILabel!
    
    func setupCell(with model: Counts) {
        clickCountsLabel.text = ("\(model.counts)")
        //clickCountsLabel.center = self.center
    }
    
    
}
