//
//  ELCoinImage.swift
//  ELiON
//
//  Created by Lingeswaran Kandasamy on 11/3/21.
//

import UIKit

class ELCoinImage: UIImageView {

    let cache           = NetworkManager.shared.cache
    let placeHoldeImage = Images.placeHolder
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func downloadImage(fromURL url: String) {
        Task { image = await  NetworkManager.shared.downloadImage(from: url) ?? placeHoldeImage}
    }
    
    private func configure() {
        layer.cornerRadius          = 10
        clipsToBounds               = true
        image                       = placeHoldeImage
        translatesAutoresizingMaskIntoConstraints = false
    }
}
