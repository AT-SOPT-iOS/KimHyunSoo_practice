//
//  ViewController.swift
//  SOPT36_Practice
//
//  Created by MaengKim on 4/9/25.
//

import UIKit

class ViewController: UIViewController {
    
    var yellowView: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()
    
    var greenView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()
    
    var blackView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    var blueView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        setLayout()
    }
    
    func setLayout() {
        [yellowView, greenView, blackView, blueView].forEach {
            [weak self] view in
            guard let self = self else { return }
            self.view.addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            yellowView.topAnchor.constraint(equalTo: view.topAnchor),
            yellowView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width/2),
            yellowView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            yellowView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height/4)
        ])
        
        NSLayoutConstraint.activate([
            greenView.topAnchor.constraint(equalTo: yellowView.bottomAnchor),
            greenView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width/2),
            greenView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            greenView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height/4)
        ])
        
        NSLayoutConstraint.activate([
            blackView.topAnchor.constraint(equalTo: greenView.bottomAnchor),
            blackView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width/2),
            blackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            blackView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height/4)
        ])
        
        NSLayoutConstraint.activate([
            blueView.topAnchor.constraint(equalTo: blackView.bottomAnchor),
            blueView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            blueView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width/2),
            blueView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height/4),
            blueView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

