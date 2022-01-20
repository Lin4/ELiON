//
//  KeyStats.swift
//  ELiON
//
//  Created by Lingeswaran Kandasamy on 1/9/22.
//

import UIKit

enum ItemType {
    case curPrice, marketCap, price24Change, market24CapChange
}

class ELKeyStatsView: UIView {

    let symbolImageView = UIImageView()
    let titleLabel = ELSecondaryLabel(fontSize: 14, numberOfLines: 1)
    let currentPriceLabel = ELTitleLabel(textAlignment: .left, fontSize: 17)
    let priceChanePercentage24hLabel = ELTitleLabel(textAlignment: .left, fontSize: 13)
    let marketCapLabel = ELTitleLabel(textAlignment: .left, fontSize: 17)
    let marketCapChangePercentageLabel = ELTitleLabel(textAlignment: .left, fontSize: 13)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        addSubviews(titleLabel, symbolImageView, currentPriceLabel, priceChanePercentage24hLabel)
        
        symbolImageView.translatesAutoresizingMaskIntoConstraints = false
        symbolImageView.contentMode = .scaleAspectFill
        symbolImageView.tintColor = .label
        let padding: CGFloat = 20
        let spacingConst: CGFloat = 15
        
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: padding),
            
            currentPriceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: spacingConst),
            currentPriceLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            currentPriceLabel.heightAnchor.constraint(equalToConstant: padding),
            
            symbolImageView.topAnchor.constraint(equalTo: currentPriceLabel.bottomAnchor, constant: spacingConst),
            symbolImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            symbolImageView.widthAnchor.constraint(equalToConstant: padding),
            symbolImageView.heightAnchor.constraint(equalToConstant: padding),
            
            priceChanePercentage24hLabel.topAnchor.constraint(equalTo: currentPriceLabel.bottomAnchor, constant: spacingConst),
            priceChanePercentage24hLabel.leadingAnchor.constraint(equalTo: symbolImageView.trailingAnchor, constant: spacingConst),
            priceChanePercentage24hLabel.heightAnchor.constraint(equalToConstant: padding)
            
        ])
    }
    
    
    func set(itemType: ItemType, curPrice: Double, priceChange24H: Double, symbolImage: String, tintColors: UIColor) {
        
        switch itemType {
            
        case .curPrice:
            titleLabel.text          = "Current Price"
        case .marketCap:
            titleLabel.text          = "Market Capitalization"
        case .price24Change:
            titleLabel.text          = "24h Price Change"
        case .market24CapChange:
            titleLabel.text          = "24h Market Cap Change"
        }
        
        symbolImageView.image = UIImage(systemName: symbolImage)
        symbolImageView.tintColor = tintColors
        currentPriceLabel.text = String(curPrice.doubleToCurrencyWith2Decimal())
        priceChanePercentage24hLabel.text = String(priceChange24H.doubleToCurrencyWith2Decimal()) + "%"
        priceChanePercentage24hLabel.textColor = tintColors
    }
}
