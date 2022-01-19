//
//  HeaderView.swift
//  ELiON
//
//  Created by Lingeswaran Kandasamy on 1/7/22.
//

import UIKit

class ELHeaderVC: UIViewController {
    let coinImage   = ELCoinImage(frame: .zero)
    let coinName    = ELTitleLabel(textAlignment: .left, fontSize: 34)
    let price       = ELTitleLabel(textAlignment: .left, fontSize: 18)
    
    
    var coinData: CoinMarketData!
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubviews(coinImage, coinName, price)
        layoutUI()
        configureElements()
    }
    
    init(coinData: CoinMarketData) {
        super.init(nibName: nil, bundle: nil)
        self.coinData = coinData
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configureElements(){
        
        coinImage.downloadImage(fromURL: coinData.image)
        coinName.text = coinData.name
        price.text = "\(coinData.current_price.doubleToCurrencyWith2Decimal())"
        
    }
    
    
    func layoutUI() {
        let padding: CGFloat            = 20
    
        coinImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            coinImage.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
            coinImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            coinImage.heightAnchor.constraint(equalToConstant: 90),
            coinImage.widthAnchor.constraint(equalToConstant: 90),
            
            coinName.topAnchor.constraint(equalTo: coinImage.topAnchor),
            coinName.leadingAnchor.constraint(equalTo: coinImage.trailingAnchor, constant: 15),
            coinName.heightAnchor.constraint(equalToConstant: 40),

            price.topAnchor.constraint(equalTo: coinName.bottomAnchor, constant: padding),
            price.leadingAnchor.constraint(equalTo: coinImage.trailingAnchor, constant: 15),
            price.heightAnchor.constraint(equalToConstant: 40)
        
        
        ])
    }
}
