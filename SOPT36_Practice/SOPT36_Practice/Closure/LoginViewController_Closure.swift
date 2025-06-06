//
//  LoginViewController_Closure.swift
//  SOPT36_Practice
//
//  Created by MaengKim on 4/12/25.
//

import UIKit

class LoginViewController_Closure: UIViewController {
    
    // MARK: - Property
    
    let titleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 64, y: 161, width: 280, height: 80))
        label.text = "동네라서 가능한 모든것\n당근에서 가까운 이웃과 함께해요."
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = .bold
        return label
    }()
    
    let idTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 34, y: 276, width: 335, height: 52))
        textField.placeholder = "아이디"
        textField.borderStyle = .roundedRect
        textField.font = .regular
        textField.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        return textField
    }()
        
    let passwordTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 34, y: 335, width: 335, height: 52))
        textField.placeholder = "비밀번호"
        textField.borderStyle = .roundedRect
        textField.font = .regular
        textField.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        return textField
    }()
    
    var loginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 34, y: 422, width: 332, height: 58))
        button.backgroundColor = UIColor(red: 255/255, green: 111/255, blue: 15/255, alpha: 1)
        button.setTitle("로그인하기", for: .normal)
        button.layer.cornerRadius = 10
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .medium
        button.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        setLayout()
    }
    
    // MARK: - UISetting
    
    private func setLayout() {
        [titleLabel, idTextField, passwordTextField, loginButton].forEach {
            self.view.addSubview($0)
        }
    }
    
    // MARK: - Function
    
    private func presentToWelcomeVC() {
        let welcomeViewController = WelcomeViewController_DelegatePattern()
        welcomeViewController.id = idTextField.text
        self.present(welcomeViewController, animated: true)
    }
    
    private func pushToWelcomeVC() {
        let welcomeViewController = WelcomeViewController_Closure()
        welcomeViewController.id = idTextField.text
        welcomeViewController.loginDataCompletion = { [weak self] data in
            guard let self = self else { return }
            self.idTextField.text = data
        }
        self.navigationController?.pushViewController(welcomeViewController, animated: true)
    }
    
    @objc
    private func loginButtonDidTap() {
        //presentToWelcomeVC()
        pushToWelcomeVC()
    }
}

