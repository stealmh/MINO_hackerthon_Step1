//
//  SettingTableViewController.swift
//  HackerTonStep1
//
//  Created by kimminho on 2022/10/13.
//

import UIKit

class SettingTableViewController: UIViewController {

    @IBOutlet weak var settingTableView: UITableView!
    var testLabel: [String] = ["1","2","3"]
    override func viewDidLoad() {
        super.viewDidLoad()
        settingTableView.delegate = self
        settingTableView.dataSource = self
        settingTableView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    }
    

}


extension SettingTableViewController: UITableViewDelegate,UITableViewDataSource{
    
    
    //섹션의 개수
    func numberOfSections(in tableView: UITableView) -> Int {
        return testLabel.count
    }
    //섹션의 제목
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "섹션 1"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return testLabel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell", for: indexPath) as! SettingTableViewCell
        cell.infoLabel.text = testLabel[indexPath.row]
        tableView.rowHeight = 50
        return cell
    }
    
    
}
