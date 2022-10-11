//
//  tableViewController.swift
//  HackerTonStep1
//
//  Created by kimminho on 2022/10/11.
//

import UIKit

class tableViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var koreaLocationName: [String] = ["서울","부산","인천","대전","광주","대구","울산"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
    }

}

extension tableViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return koreaLocationName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! myTableViewCell
        cell.tableLbl.text = koreaLocationName[indexPath.row]
        tableView.rowHeight = 120
        return cell
    }
    
    
}
