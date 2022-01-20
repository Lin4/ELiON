//
//  ELCoinDetaiVC.swift
//  ELiON
//
//  Created by Lingeswaran Kandasamy on 1/17/22.
//

import UIKit

class ELKeyStatsItemOneVC: ELKeyStatsInfoVC {

    var coinData: CoinMarketData!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
        
    }

    init(coinData: CoinMarketData) {
        super.init(nibName: nil, bundle: nil)
        self.coinData = coinData
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configureItems(){
        
        keyStatsViewOne.set(itemType: .curPrice, curPrice: coinData.current_price, priceChange24H: coinData.price_change_percentage_24h, symbolImage: findSymbolImage(priceChange: coinData.price_change_percentage_24h), tintColors: findArrowColor(trangleName: findSymbolImage(priceChange: coinData.price_change_percentage_24h)))
        
        
        keyStatsViewTwo.set(itemType: .marketCap, curPrice: coinData.market_cap, priceChange24H: coinData.market_cap_change_percentage_24h, symbolImage: findSymbolImage(priceChange: coinData.market_cap_change_percentage_24h), tintColors: findArrowColor(trangleName: findSymbolImage(priceChange: coinData.market_cap_change_percentage_24h)))
        
    }

}
