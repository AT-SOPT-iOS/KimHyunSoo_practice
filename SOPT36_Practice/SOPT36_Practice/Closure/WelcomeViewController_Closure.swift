//
//  WelcomeViewController_Closure.swift
//  SOPT36_Practice
//
//  Created by MaengKim on 4/12/25.
//

import UIKit

class WelcomeViewController_Closure: UIViewController {
    
    // MARK: - Property
    
    var id: String? = ""
    
    var loginDataCompletion: ((String) -> Void)?
    
    let image:UIImageView = {
        let image = UIImageView(frame: CGRect(x: 130, y: 112, width: 150, height: 150))
        image.image = .image
        return image
    }()
    
    let titleLabel:UILabel = {
        let label = UILabel(frame: CGRect(x: 140, y: 290, width: 120, height: 60))
        label.text = ""
        label.font = .bold
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }()
    
    var mainButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 34, y: 422, width: 332, height: 58))
        button.backgroundColor = UIColor(red: 255/255, green: 111/255, blue: 15/255, alpha: 1)
        button.setTitle("메인으로", for: .normal)
        button.layer.cornerRadius = 10
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .medium
        button.addTarget(self, action: #selector(backToLoginButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    var returnButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 34, y: 498, width: 332, height: 58))
        button.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        button.setTitle("다시 로그인", for: .normal)
        button.layer.cornerRadius = 10
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .medium
        button.addTarget(self, action: #selector(backToLoginButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        setLayout()
        bindID()
    }
    
    // MARK: - UISetting
    
    private func setLayout() {
        [image, titleLabel, mainButton, returnButton].forEach {
            self.view.addSubview($0)
        }
    }
    
    // MARK: - Function

    private func bindID() {
        if let id = self.id, !id.isEmpty {
            self.titleLabel.text = "\(id)님 \n반가워요!"
        } else {
            self.titleLabel.text = "아이디를 입력해주세요!"
        }
    }
    
    @objc
    private func backToLoginButtonDidTap() {
        guard let loginDataCompletion else { return }
        
        if let id = id {
            loginDataCompletion(id)
        }
        
        if self.navigationController == nil {
            self.dismiss(animated: true)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
}
