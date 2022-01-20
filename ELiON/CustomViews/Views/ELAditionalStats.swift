//
//  ELAditionalStats.swift
//  ELiON
//
//  Created by Lingeswaran Kandasamy on 1/19/22.
//

import UIKit

enum AditionalCoinDetails {
    
    case rank, totalVolume, highIn24, lowIn24, circulatingSupply, totalSupply, lastUpdated, fullyDilutedCapitalization
}

class ELAditionalStats: UIView {

    let titleLabel = ELSecondaryLabel(fontSize: 12, numberOfLines: 1)
    let rankLabel = ELTitleLabel(textAlignment: .left, fontSize: 17)
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        addSubviews(titleLabel, rankLabel)
        
    
        let padding: CGFloat = 20
        let spacingConst: CGFloat = 10
        
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: padding),
            
            rankLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: spacingConst),
            rankLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            rankLabel.heightAnchor.constraint(equalToConstant: padding),
            
        ])
    }
    
    func set(aditionalDetails: AditionalCoinDetails, coinData: String) {
        
        switch aditionalDetails {
            
        case .rank:
            titleLabel.text          = "Rank"
        case .totalVolume:
            titleLabel.text          = "Total volume"
        case .highIn24:
            titleLabel.text          = "24h High"
        case .lowIn24:
            titleLabel.text          = "24h Low"
        case .circulatingSupply:
            titleLabel.text          = "Circulating Supply"
        case .totalSupply:
            titleLabel.text          = "Total Supply"
        case .lastUpdated:
            titleLabel.text          = "Last Updated"
        case .fullyDilutedCapitalization:
            titleLabel.text          = "Fully Diluted Capitalization"
        }
        
        rankLabel.text                       = coinData
    
        
    }
}
