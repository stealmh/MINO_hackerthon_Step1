//
//  myTableViewCell.swift
//  HackerTonStep1
//
//  Created by kimminho on 2022/10/11.
//

import UIKit

class myTableViewCell: UITableViewCell {

    @IBOutlet weak var tableLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
