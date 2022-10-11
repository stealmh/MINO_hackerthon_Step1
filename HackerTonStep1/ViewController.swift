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
    
    var webImage: [String] = ["batman","captain","ironman","plus.circle"]
    
    @IBOutlet weak var myPage: UIPageControl!
    @IBOutlet weak var locationName: UILabel!
    
    @IBOutlet weak var currentLocationLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        myPage.currentPage = 0
        myPage.numberOfPages = webImage.count
        
    }
    
    override func viewWillAppear(_ animated: Bool){
        if let first = paramName{
            locationName.text = first
        }
//        if let second = currentLocationParamName{
//            currentLocationLbl.text = second
//        }
        myPage.currentPage = 0
        myPage.numberOfPages = webImage.count
        
    }
    
    
    
    @IBAction func locationReAllowCheck(_ sender: UIButton) {
        if !checkLocation{
            locationName.text = "위치정보 : 수원(default)"
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        myPage.currentPage = indexPath.row
        print("idexPath.row : \(indexPath.row)")
    }
    
    
    
    


}

// MARK: 컬렉션 뷰, 페이지컨트롤 추가
extension ViewController: UICollectionViewDataSource,UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return webImage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! myCollectionViewCell
        if indexPath.row == webImage.endIndex - 1 {
            cell.myImage.image = UIImage(systemName: "plus.circle")
            cell.myLocationLabel.text = ""
            cell.myWeatherDescribeLabel.text = "지역 추가하기"
            cell.tempLabel.text = ""
            cell.myTempLabel.text = ""
            cell.humidityLabel.text = ""
            cell.myHumidityLabel.text = ""
            cell.hTempLabel.text = ""
            cell.highTempLabel.text = ""
            cell.lTempLabel.text = ""
            cell.lowTempLabel.text = ""
        }else{
            cell.myImage.image = UIImage(named: webImage[indexPath.row])
        }
        return cell
        
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

