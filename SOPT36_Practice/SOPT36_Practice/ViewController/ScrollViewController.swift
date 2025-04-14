//
//  ScrollViewController.swift
//  SOPT36_Practice
//
//  Created by MaengKim on 4/12/25.
//

import UIKit

class ScrollViewController: UIViewController {
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()

    private var redView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    private let orangeView: UIView = {
        let view = UIView()
        view.backgroundColor = .orange
        return view
    }()
    private let yellowView: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()
    private let greenView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()
    private let blueView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    private let purpleView: UIView = {
        let view = UIView()
        view.backgroundColor = .purple
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        setLayout()
    }
    
    func setLayout() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        redView.translatesAutoresizingMaskIntoConstraints = false
        orangeView.translatesAutoresizingMaskIntoConstraints = false
        yellowView.translatesAutoresizingMaskIntoConstraints = false
        greenView.translatesAutoresizingMaskIntoConstraints = false
        blueView.translatesAutoresizingMaskIntoConstraints = false
        purpleView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        [redView, orangeView, yellowView, greenView, blueView, purpleView].forEach {
            contentView.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),

            contentView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor)
        ])
        
        let heightConstraint = contentView.heightAnchor.constraint(greaterThanOrEqualTo: scrollView.heightAnchor)
        heightConstraint.priority = .defaultLow
        heightConstraint.isActive = true

       
        NSLayoutConstraint.activate([
            redView.topAnchor.constraint(equalTo: contentView.topAnchor),
            redView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            redView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width/2),
            redView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height/2)
        ])
        
        NSLayoutConstraint.activate([
            orangeView.topAnchor.constraint(equalTo: contentView.topAnchor),
            orangeView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            orangeView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width/2),
            orangeView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height/2)
        ])
        
        NSLayoutConstraint.activate([
            yellowView.topAnchor.constraint(equalTo: redView.bottomAnchor),
            yellowView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            yellowView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width/2),
            yellowView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height/2)
        ])
        
        NSLayoutConstraint.activate([
            greenView.topAnchor.constraint(equalTo: orangeView.bottomAnchor),
            greenView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            greenView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width/2),
            greenView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height/2)
        ])
        
        NSLayoutConstraint.activate([
            blueView.topAnchor.constraint(equalTo: yellowView.bottomAnchor),
            blueView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            blueView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width/2),
            blueView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height/2),
            blueView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            purpleView.topAnchor.constraint(equalTo: greenView.bottomAnchor),
            purpleView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            purpleView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width/2),
            purpleView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height/2),
            purpleView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        
    }
    
    
}
