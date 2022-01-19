//
//  ELKeyStatsInfoVC.swift
//  ELiON
//
//  Created by Lingeswaran Kandasamy on 1/17/22.
//

import UIKit

class ELKeyStatsInfoVC: UIViewController {
    
    let stackView       = UIStackView()
    let keyStatsViewOne = ELKeyStatsView()
    let keyStatsViewTwo = ELKeyStatsView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureBackgroundView()
        configureStackView()
        layoutUI()

    }
    
    func configureBackgroundView() {
        view.layer.cornerRadius = 18
        view.backgroundColor = .secondarySystemBackground
    }
    
    func configureStackView() {
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
       
        
        stackView.addArrangedSubview(keyStatsViewOne)
        stackView.addArrangedSubview(keyStatsViewTwo)
    }

    private func layoutUI() {
        view.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        let padding: CGFloat = 20
        
        
        NSLayoutConstraint.activate([
        
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            stackView.heightAnchor.constraint(equalToConstant: 60)
            
        ])
    }
    
}
