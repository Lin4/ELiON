//
//  FeaturedCoinCell.swift
//  ELiON
//
//  Created by Lingeswaran Kandasamy on 11/3/21.
//

import UIKit

class FeaturedCoinCell: UITableViewCell {
    
    static let reuseID = "FeaturedCoinCell"
    
    let featuredCoinImage = ELCoinImage(frame: .zero)
    let coinNameLabel = ELTitleLabel(textAlignment: .left, fontSize: 17)
    let coinTickerLbl = ELTitleLabel(textAlignment: .left, fontSize: 17)
    let coinPriceLbl = ELTitleLabel(textAlignment: .right, fontSize: 17)
    let coinPriceChengesLbl = ELTitleLabel(textAlignment: .right, fontSize: 17)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func set(coinData: CoinMarketData){
        featuredCoinImage.downloadImage(fromURL: coinData.image)
        coinNameLabel.text = coinData.name
        coinTickerLbl.text = coinData.symbol
        coinPriceLbl.text = "\(coinData.current_price.doubleToCurrencyWith2Decimal())"
        coinPriceChengesLbl.text = String(format: "%.2f", coinData.price_change_percentage_24h) + "%"
        if coinData.price_change_percentage_24h > 0 {
            coinPriceChengesLbl.textColor = .systemGreen
        } else {
          coinPriceChengesLbl.textColor = .systemRed
        }
    }
    
    private func configure() {
        self.addSubviews( featuredCoinImage, coinNameLabel, coinTickerLbl, coinPriceLbl, coinPriceChengesLbl )
    
        let padding: CGFloat = 15
        
        NSLayoutConstraint.activate([
            featuredCoinImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            featuredCoinImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            featuredCoinImage.heightAnchor.constraint(equalToConstant: 50),
            featuredCoinImage.widthAnchor.constraint(equalToConstant: 50),
            
            
            coinNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            coinNameLabel.leadingAnchor.constraint(equalTo: featuredCoinImage.trailingAnchor, constant: padding),
            coinNameLabel.heightAnchor.constraint(equalToConstant: 28),
            coinNameLabel.widthAnchor.constraint(equalToConstant: 160),
            
            
            coinTickerLbl.topAnchor.constraint(equalTo: coinNameLabel.bottomAnchor, constant: 15),
            coinTickerLbl.leadingAnchor.constraint(equalTo: featuredCoinImage.trailingAnchor, constant: padding),
            coinTickerLbl.heightAnchor.constraint(equalToConstant: 28),
            coinTickerLbl.widthAnchor.constraint(equalToConstant: 80),
            
            coinPriceLbl.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            coinPriceLbl.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            coinPriceLbl.heightAnchor.constraint(equalToConstant: 28),
            coinPriceLbl.widthAnchor.constraint(equalToConstant: 180),
            
            coinPriceChengesLbl.topAnchor.constraint(equalTo: coinPriceLbl.bottomAnchor, constant: 15),
            coinPriceChengesLbl.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            coinPriceChengesLbl.heightAnchor.constraint(equalToConstant: 28),
            coinPriceChengesLbl.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
}
