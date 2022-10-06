//
//  LocationDeniedView.swift
//  HackerTonStep1
//
//  Created by kimminho on 2022/10/06.
//

import UIKit

class LocationDeniedView: UIViewController {
    var btnTitle: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    @IBAction func locationBtn(_ sender: UIButton) {
        btnTitle = sender.currentTitle!
        print(btnTitle)
        self.dismiss(animated: false)
        

    }
    
}
