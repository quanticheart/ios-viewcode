//
//  WelcomeViewController.swift
//  ViewCode
//
//  Created by Jonatas Alves santos on 30/03/22.
//

import UIKit

class WelcomeViewController: UIViewController {

    override func loadView() {
        view = WelcomeView(delegate: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view?.backgroundColor = .white
        // Do any additional setup after loading the view.
    }
    
    private func setupView(){
        
    }
}

extension WelcomeViewController: WelcomeDelegate {
    func signUp() {
        print("Cadastro")
    }
    
    func signIn(with: String) {
        print(with)
    }
}
