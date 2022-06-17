//
//  WelcomeView.swift
//  ViewCode2
//
//  Created by Jonatas Alves santos on 30/03/22.
//

import UIKit

protocol WelcomeDelegate: AnyObject {
    func signUp()
    func signIn(with phone:String)
}

class WelcomeView: UIView {
    
    weak var delegate:WelcomeDelegate?
    
    init(delegate:WelcomeDelegate) {
        self.delegate = delegate
        super.init(frame: .zero)
        setup()
    }
    
    private let mainImage:UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "home")
        img.contentMode = .scaleAspectFit
        img.translatesAutoresizingMaskIntoConstraints = false
        
        return img
    }()
    
    private let titleLabel:UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("WELCOME", comment: "")
        label.textAlignment = .center
        label.numberOfLines = 1
        label.font = .title
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let bodyLabel:UILabel = {
        let label = UILabel()
        label.text = "Vamos nos exercitar?"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = .body
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let textField:UITextField = {
        let textField = UITextField()
        textField.placeholder = "Telefone"
        textField.keyboardType = .phonePad
        textField.borderStyle = .roundedRect
        textField.textAlignment = .center
        textField.textColor = .lightGray
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let signInBtn = AppButton(style: .main, title: "Entrar")
    private let signUpBtn = AppButton(style: .secondary, title: "Cadastrar")
    
    private let stackBtns: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.alignment = .center
        stack.spacing = .normal
    
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    required init?(coder: NSCoder){
        fatalError("ERROR INIT")
    }
    
    @objc private func signInBtnAction(){delegate?.signIn(with: textField.text!)}
    
    @objc private func signUpBtnAction(){delegate?.signUp()}
}

extension WelcomeView: CodeView{
    func components() {
        addSubview(mainImage)
        addSubview(titleLabel)
        addSubview(bodyLabel)
        addSubview(textField)
        
        stackBtns.addArrangedSubview(signInBtn)
        stackBtns.addArrangedSubview(signUpBtn)

        addSubview(stackBtns)
    }
   
    func constrains() {
        mainImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: .normal).isActive = true
        mainImage.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: .normal).isActive = true
        mainImage.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -.normal).isActive = true
        mainImage.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: mainImage.bottomAnchor, constant: .normal).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: mainImage.leadingAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: mainImage.trailingAnchor).isActive = true
        
        bodyLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: .normal).isActive = true
        bodyLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
        bodyLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor).isActive = true
        
        textField.topAnchor.constraint(equalTo: bodyLabel.bottomAnchor, constant: .normal).isActive = true
        textField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .normal).isActive = true
        textField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -.normal).isActive = true
        
        stackBtns.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: .normal).isActive = true
        stackBtns.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        signInBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        signInBtn.widthAnchor.constraint(equalToConstant: 120).isActive = true
        
        signUpBtn.heightAnchor.constraint(equalTo: signInBtn.heightAnchor).isActive = true
    }
    
    func extraConfigurations() {
        backgroundColor = .white
        signInBtn.addTarget(self, action: #selector(signInBtnAction), for: .touchUpInside)
        signUpBtn.addTarget(self, action: #selector(signUpBtnAction), for: .touchUpInside)
    }
}
