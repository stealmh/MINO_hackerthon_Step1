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
    var tableviewController = tableViewController()
    var v1TestValue: Int?
    var webImage: [String] = ["a","b","c","default","test","plus.circle"]

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()

    }
//
//    override func viewWillAppear(_ animated: Bool) {
//        if let first =
//    }
    

    @IBAction func locationReAllowCheck(_ sender: UIButton) {
        if !checkLocation{
            locationYesOrNoLabel.text = "위치정보 : 수원(default)"
        }
    }
    
    //휴지통 클릭시 이벤트
    @objc func deleteTapped(sender: UIButton) {
        if webImage.count <= 2{
            print("셀을 삭제할 수 없음")
        }else{
            collectionview.deleteItems(at: [IndexPath.init(row: sender.tag, section: 0)])
            webImage.remove(at: sender.tag)
            print(webImage)
            collectionview.reloadData()
        }
    }
    //
    
    //이미지 클릭시 이벤트
    @objc func imageTapped() {
        
        guard let second = storyboard?.instantiateViewController(withIdentifier: "secondVC") as? tableViewController else {return}
        present(second, animated: true,completion: nil)
        webImage.popLast()
        webImage.append("plus.circle")
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
        cell.deleteButton.tag = indexPath.row
        cell.deleteButton.addTarget(self, action: #selector(deleteTapped(sender:)), for: .touchUpInside)
        
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
            cell.deleteButton.isEnabled = false
            cell.deleteButton.isHidden = true
            
            //이미지 클릭할 수 있게끔 하는 코드
            let imageClick = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
            cell.myImage.isUserInteractionEnabled = true
            cell.myImage.addGestureRecognizer(imageClick)
            //
            
            //
//            cell.deleteButton.tag = indexPath.row
//            cell.deleteButton.addTarget(self, action: #selector(deleteTapped(sender:)), for: .touchUpInside)
            //
        }else{
            cell.myImage.image = UIImage(named: webImage[indexPath.row])
            cell.myLocationLabel.text = webImage[indexPath.row]
            cell.myWeatherDescribeLabel.text = "맑음"
            cell.tempLabel.text = "현재 기온"
            cell.myTempLabel.text = "20도"
            cell.humidityLabel.text = "현재 습도"
            cell.myHumidityLabel.text = "50%"
            cell.hTempLabel.text = "금일 최고온도"
            cell.highTempLabel.text = "99도"
            cell.lTempLabel.text = "금일 최저온도"
            cell.lowTempLabel.text = "50도"
            cell.deleteButton.isHidden = false
            cell.deleteButton.isEnabled = true
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


