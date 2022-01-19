//
//  UIView+Ext.swift
//  ELiON
//
//  Created by Lingeswaran Kandasamy on 11/3/21.
//

import UIKit

extension UIView {
    
    func pinToEdges(of superView: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        
           topAnchor.constraint(equalTo: superView.topAnchor),
           leadingAnchor.constraint(equalTo: superView.leadingAnchor),
           trailingAnchor.constraint(equalTo: superView.trailingAnchor),
           bottomAnchor.constraint(equalTo: superView.bottomAnchor)
        
        ])
    }
    
    
    func addSubviews(_ views: UIView...) {
        for view in views { addSubview(view) }
    }
}
