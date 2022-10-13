//
//  checkLocationViewController.swift
//  HackerTonStep1
//
//  Created by kimminho on 2022/10/06.
//

import UIKit


//서울 . 부산 뷰
class checkLocationViewController: UIViewController{
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("hello")
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backBtn(_ sender: UIButton) {
        let preVC = self.presentingViewController
        guard let vc = preVC as? ViewController else {return}
//        vc.paramName = sender.currentTitle
        vc.webImage.append("batman")
        vc.currentLocationParamName = "위치정보 : 미사용"
        self.presentingViewController?.dismiss(animated: true)
        
    }

}
