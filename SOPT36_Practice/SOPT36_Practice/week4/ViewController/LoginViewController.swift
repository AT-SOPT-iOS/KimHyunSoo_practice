//
//  LoginViewController.swift
//  SOPT36_Practice
//
//  Created by MaengKim on 5/5/25.
//

import UIKit

import SnapKit
import Then

final class LoginViewController: UIViewController {
    
    // MARK: - UIComponent
    
    private let stackView = UIStackView()
    
    private let idTextField = UITextField()
    private let passwordTextField = UITextField()
    private let nicknameTextField = UITextField()
    private let nicknameLabel = UILabel()
    private let nicknameButton = UIButton()
    private let getNicknameButton = UIButton()
    private let loginButton = UIButton()
    
    private var loginId: String = ""
    private var password: String = ""
    private var userId: Int? = nil
    private var nickname: String = ""
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setUI()
        setLayout()
        setAction()
    }
    
    // MARK: - UISetting
    
    private func setStyle() {
        self.view.do {
            $0.backgroundColor = .white
        }
        
        stackView.do {
            $0.axis = .vertical
            $0.axis = .vertical
            $0.distribution = .equalSpacing
            $0.spacing = 20
        }
        
        idTextField.do {
            $0.placeholder = "ID"
            $0.borderStyle = .roundedRect
            $0.backgroundColor = .lightGray
        }
        
        passwordTextField.do {
            $0.placeholder = "PW"
            $0.borderStyle = .roundedRect
            $0.backgroundColor = .lightGray
        }
        
        nicknameTextField.do {
            $0.placeholder = "닉네임 변경하고 싶으면 해당 칸에 입력하세요."
            $0.borderStyle = .roundedRect
            $0.backgroundColor = .lightGray
        }
        
        nicknameLabel.do {
            $0.text = ""
            $0.textColor = .blue
            $0.font = .systemFont(ofSize: 15, weight: .bold)
        }
        
        getNicknameButton.do {
            $0.backgroundColor = .blue
            $0.setTitle("닉네임 조회하기", for: .normal)
            $0.titleLabel?.textColor = .white
        }
        
        nicknameButton.do {
            $0.backgroundColor = .blue
            $0.setTitle("닉네임 변경하기", for: .normal)
            $0.titleLabel?.textColor = .white
        }
        
        loginButton.do {
            $0.backgroundColor = .blue
            $0.setTitle("로그인", for: .normal)
            $0.titleLabel?.textColor = .white
        }
    }
    
    private func setUI() {
        self.view.addSubview(stackView)
        
        [idTextField, passwordTextField, nicknameLabel, getNicknameButton, nicknameTextField, nicknameButton, loginButton].forEach {
            self.stackView.addArrangedSubview($0)
        }
    }
    
    private func setLayout() {
        stackView.snp.makeConstraints {
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(40)
            $0.top.bottom.equalTo(self.view.safeAreaLayoutGuide).inset(200)
        }
    }
    
    private func setAction() {
        idTextField.addTarget(self, action: #selector(textFieldDidEditing), for: .allEvents)
        passwordTextField.addTarget(self, action: #selector(textFieldDidEditing), for: .allEvents)
        loginButton.addTarget(self, action: #selector(loginButtonTap), for: .touchUpInside)
        getNicknameButton.addTarget(self, action: #selector(getNicknameButtonTap), for: .touchUpInside)
        nicknameButton.addTarget(self, action: #selector(updateNicknameButtonTap), for: .touchUpInside)
    }
    
    @objc
    private func textFieldDidEditing(_ textField: UITextField) {
        switch textField {
        case idTextField:
            loginId = textField.text ?? ""
        case passwordTextField:
            password = textField.text ?? ""
        default:
            nickname = nicknameTextField.text ?? ""
        }
    }
    
    @objc
    private func loginButtonTap() {
        Task {
            do {
                let response = try await LoginService.shared.PostLoginData(loginId: self.loginId, password: self.password)
                
                self.userId = response.userId
                
                let alert = UIAlertController(title: "로그인 성공", message: "환영해요", preferredStyle: .alert)
                
                let okAction = UIAlertAction(title: "확인", style: .default)
                alert.addAction(okAction)
                self.present(alert, animated: true)
            } catch {
                let alert = UIAlertController(title: "로그인 실패", message: error.localizedDescription, preferredStyle: .alert)
                let okAction = UIAlertAction(title: "확인", style: .default)
                alert.addAction(okAction)
                self.present(alert, animated: true)
                
                print("로그인 에러: ", error)
            }
        }
    }
    
    @objc
    private func getNicknameButtonTap() {
        Task {
            guard let userId = self.userId else {
                self.nicknameLabel.text = "로그인 해주세요."
                return
            }
            
            do {
                let nickname = try await GetMyInfoService.shared.fetchNickname(userId: userId)
                self.nicknameLabel.text = "닉네임: \(nickname)"
            } catch {
                self.nicknameLabel.text = "로그인 해주세요."
            }
        }
    }
    
    @objc
    private func updateNicknameButtonTap() {
        Task {
            guard let userId = self.userId else {
                self.nicknameLabel.text = "로그인 해주세요."
                return
            }
            
            guard let newNickname = nicknameTextField.text, !newNickname.isEmpty else {
                self.nicknameLabel.text = "닉네임을 입력해주세요."
                return
            }
            
            do {
                let response = try await UpdateNicknameService.shared.UpdateNicknameData(userId: userId, nickname: newNickname)
                
                let alert = UIAlertController(title: "닉네임 변경 성공", message: "축하드려요", preferredStyle: .alert)
                
                let okAction = UIAlertAction(title: "확인", style: .default)
                alert.addAction(okAction)
                self.present(alert, animated: true)
                
                self.nicknameLabel.text = "새 닉네임: \(newNickname)"
            } catch {
                let alert = UIAlertController(
                    title: "닉네임 변경 실패", message: error.localizedDescription, preferredStyle: .alert
                )
                let okAction = UIAlertAction(title: "확인", style: .default)
                alert.addAction(okAction)
                self.present(alert, animated: true)
                print("닉네임 변경 에러:", error)
            }
        }
    }
}
