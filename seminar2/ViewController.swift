//
//  ViewController.swift
//  seminar2
//
//  Created by seif on 2023-09-22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    private func configureUI(){
        let ourView = UIView()
        
        view.addSubview(ourView)
        ourView.backgroundColor = .blue
        
        ourView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        ourView.heightAnchor.constraint(equalToConstant: 200),
        ourView.widthAnchor.constraint(equalToConstant: 250),
        ourView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
        ourView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
        
        let otherView = UIView()
        view.addSubview(otherView)
        
        otherView.pinLeft(to: ourView.trailingAnchor)
        otherView.backgroundColor = .darkGray
        otherView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        otherView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        otherView.centerYAnchor.constraint(equalTo: ourView.centerYAnchor).isActive = true
        
        
        let rightView = UIView()
        view.addSubview(rightView)
        rightView.backgroundColor = .green
        rightView.translatesAutoresizingMaskIntoConstraints = false
        
        rightView.pinRight(to: ourView.leadingAnchor)
        rightView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        rightView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        rightView.centerYAnchor.constraint(equalTo: ourView.centerYAnchor).isActive = true
        
        let topView = UIView()
        view.addSubview(topView)
        topView.backgroundColor = .red
        topView.translatesAutoresizingMaskIntoConstraints = false
        
        topView.pinTop(to: ourView.bottomAnchor)
        topView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        topView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        topView.centerXAnchor.constraint(equalTo: ourView.centerXAnchor).isActive = true
        
        let bottomView = UIView()
        view.addSubview(bottomView)
        bottomView.backgroundColor = .purple
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        
        bottomView.pinBottom(to: ourView.topAnchor)
        bottomView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        bottomView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        bottomView.centerXAnchor.constraint(equalTo: ourView.centerXAnchor).isActive = true
        
        let centerView = UIView()
        view.addSubview(centerView)
        centerView.backgroundColor = .orange
        centerView.translatesAutoresizingMaskIntoConstraints = false

        centerView.pinCenter(to: ourView)
        centerView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        centerView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
    }

}


