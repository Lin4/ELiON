//
//  ELDetailStatsInfoVC.swift
//  ELiON
//
//  Created by Lingeswaran Kandasamy on 1/19/22.
//

import UIKit

class ELDetailKeyStatsInfoVC: UIViewController {
    let stackView       = UIStackView()
    let detailStatsViewOne = ELAditionalStats()
    let detailStatsViewTwo = ELAditionalStats()
    
    
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
       
        
        stackView.addArrangedSubview(detailStatsViewOne)
        stackView.addArrangedSubview(detailStatsViewTwo)
    }

    private func layoutUI() {
        view.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        let padding: CGFloat = 10
        
        
        NSLayoutConstraint.activate([
        
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            stackView.heightAnchor.constraint(equalToConstant: 30)
            
        ])
    }
    
}
