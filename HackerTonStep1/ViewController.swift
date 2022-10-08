//
//  ViewController.swift
//  HackerTonStep1
//
//  Created by kimminho on 2022/10/05.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    var locationManager: CLLocationManager!
    let myStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    var checkLocation: Bool = false
    var paramName: String?
    var currentLocationParamName: String?
    
    @IBOutlet weak var locationName: UILabel!
    @IBOutlet weak var currentLocationLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
    }
    
    override func viewWillAppear(_ animated: Bool){
        if let first = paramName{
            locationName.text = first
        }
        if let second = currentLocationParamName{
            currentLocationLbl.text = second
        }
    }
    
    
    @IBAction func locationReAllowCheck(_ sender: UIButton) {
        if !checkLocation{
            locationName.text = "위치정보 : 수원(default)"
        }
    }
    
    
    
    


}

// MARK: 위치를 받기 위한 기능들


extension ViewController:CLLocationManagerDelegate{
    
    func setup(){
        locationManager = CLLocationManager()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest //정확한 위치를 받기
        locationManager.delegate = self
        self.locationManager.requestWhenInUseAuthorization()
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        switch status{
              //항상 사용          //사용하는동안 1번만사용
        case .authorizedAlways, .authorizedWhenInUse:
            print("사용자 : 위치 허용")
            self.locationManager.startUpdatingLocation()
            checkLocation = true
            locationName.text = "제주도"
        case .restricted, .notDetermined:
            print("사용자 : 위치 사용 여부 체크중")
            
            // 허용 거부
        case .denied:
            let aController = myStoryBoard.instantiateViewController(withIdentifier: "locationFalseController")
            aController.modalPresentationStyle = .fullScreen
            checkLocation = false
            DispatchQueue.main.async {
                self.present(aController, animated: false)
            }
        default:
            print("GPS: default")
            
            
        }
    }
    
}

