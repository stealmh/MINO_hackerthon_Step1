//
//  CollectionViewController.swift
//  HackerTonStep1
//
//  Created by kimminho on 2022/10/12.
//

import UIKit

private let reuseIdentifier = "cell"

class CollectionViewController: UICollectionViewController {

    var webImage: [String] = ["default","plus.circle"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
//    @objc func tapped() {
//        print("hello")
//        }
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */
    

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return webImage.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! myCollectionViewCell
        
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
//            let imageClick = UITapGestureRecognizer(target: self, action: #selector(tapped))
//            cell.myImage.isUserInteractionEnabled = true
//            cell.myImage.addGestureRecognizer(imageClick)
            //
        }else{
            cell.myImage.image = UIImage(named: webImage[indexPath.row])
            cell.myLocationLabel.text = webImage[indexPath.row]
        }
    
        // Configure the cell
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
