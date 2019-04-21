import UIKit

class TableViewController: UIViewController {
    
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var mainTable: UITableView!
    var randomNumber: [Int] = []
    let cellsCount = 35
    
    override func viewDidLoad() {
        
        if randomNumber.isEmpty {
            for _ in 0...cellsCount {
                randomNumber.append(Int.random(in: 0..<cellsCount))
            }
        }
        
        
    }
    
}

extension TableViewController: UITableViewDelegate, UITableViewDataSource {


func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return cellsCount
    
    }

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = mainTable.dequeueReusableCell(withIdentifier: TableCell.identifier) as! TableCell
    cell.label.text = String(randomNumber[indexPath.row])
    return cell
    
}
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        let aStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = aStoryboard.instantiateViewController(withIdentifier: "NumberStoryboard") as UIViewController

        
        navigationController?.pushViewController(vc, animated: true)
        
        

        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        label.center = vc.view.center
        label.textAlignment = .center
        label.text = String(randomNumber[indexPath.row])
        

        vc.view.addSubview(label)
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
        
    }

}

