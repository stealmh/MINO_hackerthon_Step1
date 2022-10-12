//
//  ViewController.swift
//  HackerTonStep1
//
//  Created by kimminho on 2022/10/05.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    @IBOutlet weak var collectionview: UICollectionView!
    var locationManager: CLLocationManager!
    var checkLocation: Bool = false
    var mycell = myCollectionViewCell()
    @IBOutlet weak var locationYesOrNoLabel: UILabel!
    
    var webImage: [String] = ["default","plus.circle"]

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()

    }

    @IBAction func locationReAllowCheck(_ sender: UIButton) {
        if !checkLocation{
            locationYesOrNoLabel.text = "위치정보 : 수원(default)"
        }
    }
    //이미지 클릭시 이벤트
    @objc func tapped() {
        webImage.append("TEST_DATA")
        collectionview.reloadData()
    }
    //
}

// MARK: 컬렉션 뷰
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
            
            //이미지 클릭할 수 있게끔 하는 코드
            let imageClick = UITapGestureRecognizer(target: self, action: #selector(tapped))
            cell.myImage.isUserInteractionEnabled = true
            cell.myImage.addGestureRecognizer(imageClick)
            //
        }else{
            cell.myImage.image = UIImage(named: webImage[indexPath.row])
            cell.myLocationLabel.text = webImage[indexPath.row]
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
            locationYesOrNoLabel.text = "위치 사용중"
            locationYesOrNoLabel.backgroundColor = .red
        case .restricted, .notDetermined:
            print("사용자 : 위치 사용 여부 체크중")
            // 허용 거부
        case .denied:
            checkLocation = false
        default:
            print("GPS: default")
            
            
        }
    }
    
}


