import UIKit
import SwiftUI

class ExampleTableViewController: UITableViewController {
    private let reuseIdentifier = "ProductCell"
    
    private var products = [
        "Mac",
        "iPhone",
        "Watch"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        
        // SwiftUI の View をカスタムセルとして利用
        cell.contentConfiguration = UIHostingConfiguration(content: {
            ExampleCellView(name: products[indexPath.row])
        })
        
        return cell
    }
}
