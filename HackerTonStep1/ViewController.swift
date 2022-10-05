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

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
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
        case .authorizedAlways, .authorizedWhenInUse:
            print("사용자 : 위치 허용")
            self.locationManager.startUpdatingLocation()
        case .restricted, .notDetermined:
            print("사용자 : 위치 사용 여부 체크중")
        case .denied: // 허용 거부
            print("사용자클릭 : 위치 허용 거부")
        default:
            print("GPS: default")
            
            
        }
    }
    
}

