//
//  AppButton.swift
//  ViewCode2
//
//  Created by Jonatas Alves santos on 30/03/22.
//

import UIKit

class AppButton: UIButton {

   static let heigth = 50
    
    enum Style {
        case main, secondary
    }
    
    var style:Style = .main
    var title:String = ""
    
    init(style:Style, title:String){
        self.style = style
        self.title = title
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        let titleColor: UIColor
        let bgColor: UIColor
        
        switch style {
        case .main:
            titleColor = .mainButtonText
            bgColor = .mainButton
        case .secondary:
            titleColor = .secondaryButtonText
            bgColor = .secondaryButton
            layer.borderWidth = 1
            layer.borderColor = UIColor.secondaryButtonBorder.cgColor
        }
        
        setTitleColor(titleColor, for: .normal)
        backgroundColor = bgColor
        titleLabel?.font = .button
        setTitle(title, for: .normal)
        layer.cornerRadius = 25
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
    }
}
