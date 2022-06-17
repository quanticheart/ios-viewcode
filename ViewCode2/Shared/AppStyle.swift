//
//  AppStyle.swift
//  ViewCode2
//
//  Created by Jonatas Alves santos on 30/03/22.
//

import UIKit

extension CGFloat {
    static let small: CGFloat = 8
    static let normal: CGFloat = 16
    static let big: CGFloat = 32
}

extension UIFont {
    static let title = UIFont.boldSystemFont(ofSize: 28)
    static let body = UIFont.systemFont(ofSize: 14)
    static let button = UIFont.systemFont(ofSize: 14)
}

extension UIColor {
    convenience init(r:CGFloat, g:CGFloat, b:CGFloat, alpha:CGFloat = 0){
        self.init(cgColor: CGColor(red: r/255, green: g/255, blue: b/255, alpha: alpha/255))
    }
    
    static let mainBlack = UIColor(r: 20, g: 20, b: 20)
    static let mediumGray = UIColor(r: 124, g: 124, b: 124)
    static let purpleRain = UIColor(r: 97, g: 97, b: 255)
    static let ultraLightGray = UIColor(r: 251, g: 251, b: 251)
    
    static let title = mainBlack
    static let body = mediumGray
    static let mainButton = purpleRain
    static let mainButtonText = white
    
    static let secondaryButton = white
    static let secondaryButtonText = mainBlack
    static let secondaryButtonBorder = mainBlack
    
    static let view = ultraLightGray

}
