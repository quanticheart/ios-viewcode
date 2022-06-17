//
//  CodeView.swift
//  ViewCode2
//
//  Created by Jonatas Alves santos on 30/03/22.
//

import Foundation

protocol CodeView {
    func setup()
    func components()
    func constrains()
    func extraConfigurations()
}

extension CodeView {
    func setup(){
        components()
        constrains()
        extraConfigurations()
    }
}
