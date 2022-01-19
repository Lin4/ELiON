//
//  ELAllertContainerView.swift
//  ELiON
//
//  Created by Lingeswaran Kandasamy on 11/3/21.
//

import UIKit

class ELAllertContainerView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        backgroundColor         = .systemBackground
        layer.cornerRadius      = 16
        layer.borderWidth       = 2
        layer.borderColor       = UIColor.white.cgColor
        translatesAutoresizingMaskIntoConstraints = false
    }
}
