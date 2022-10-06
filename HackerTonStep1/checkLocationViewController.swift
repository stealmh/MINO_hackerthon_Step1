//
//  checkLocationViewController.swift
//  HackerTonStep1
//
//  Created by kimminho on 2022/10/06.
//

import UIKit


//서울 . 부산 뷰
class checkLocationViewController: UIViewController {

    var viewControl = ViewController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //버튼 클릭시 sender.currentTitle을 ViewControllerd의 locationName에 덮어씌우기
    @IBAction func backBtn(_ sender: UIButton) {
//        viewControl.getTitle(input: sender.currentTitle)
        if let presenter = presentingViewController as? checkLocationViewController {
            presenter.viewControl.locationName.text = sender.currentTitle
            print(presenter.viewControl.locationName.text ?? "no value")
        }
        self.dismiss(animated: true, completion: nil)
    }

}
