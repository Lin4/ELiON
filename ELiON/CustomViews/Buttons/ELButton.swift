//
//  ELButton.swift
//  ELiON
//
//  Created by Lingeswaran Kandasamy on 11/3/21.
//

import UIKit

class ELButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience  init(color: UIColor, title: String, systemImageName: String) {
        self.init(frame: .zero)
        set(color: color, title: title, systemImageName: systemImageName)
    }
    
    private func configure() {
        configuration               = .tinted()
        configuration?.cornerStyle  = .medium
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func set(color: UIColor, title: String, systemImageName: String){
        
        configuration?.baseBackgroundColor = color  
        configuration?.baseForegroundColor = color
        configuration?.title = title
        
        configuration?.image = UIImage(named: systemImageName)
        configuration?.imagePadding = 6
        configuration?.imagePlacement = .leading
    }

}
