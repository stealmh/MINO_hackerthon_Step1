//
//  myCollectionViewCell.swift
//  toy111
//
//  Created by kimminho on 2022/10/10.
//

import UIKit

class myCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var myLocationLabel: UILabel!
    @IBOutlet weak var myWeatherDescribeLabel: UILabel!
    @IBOutlet weak var myTempLabel: UILabel!
    @IBOutlet weak var myHumidityLabel: UILabel!
    @IBOutlet weak var highTempLabel: UILabel!
    @IBOutlet weak var lowTempLabel: UILabel!
    
    // 페이지 추가를 위해 레이블 ""로 만드는 역할
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var hTempLabel: UILabel!
    @IBOutlet weak var lTempLabel: UILabel!
    
}
