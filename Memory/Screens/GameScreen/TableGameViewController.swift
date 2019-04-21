import UIKit

class TableGameViewController: UIViewController {
    

    @IBOutlet weak var mainTable: UITableView!
    
    var gameVC = GameViewController()
    var tapCountersArray: [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        mainTable.dataSource = self
        mainTable.delegate = self
        
    }
}

extension TableGameViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TapManager.allObjects().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = mainTable.dequeueReusableCell(withIdentifier: TableCellGame.identifier) as! TableCellGame
        let countMinMax = TapManager.allObjects().sorted(by: { $0.counts < $1.counts })
        let count = countMinMax[indexPath.row]
        cell.setupCell(with: count)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    
    
    
    
}

