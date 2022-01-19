//
//  ELCoinPriceChangePercentage.swift
//  ELiON
//
//  Created by Lingeswaran Kandasamy on 1/17/22.
//

import UIKit

class ELCoinPriceChangePercentage: ELKeyStatsInfoVC {

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
        
        keyStatsViewOne.set(itemType: .price24Change, curPrice: coinData.price_change_24h, priceChange24H: coinData.price_change_percentage_24h, symbolImage: findSymbolImage(priceChange: coinData.price_change_24h), tintColors: findArrowColor(trangleName: findSymbolImage(priceChange: coinData.price_change_24h)))
        
        
        keyStatsViewTwo.set(itemType: .market24CapChange, curPrice: coinData.market_cap_change_24h, priceChange24H: coinData.market_cap_change_percentage_24h, symbolImage: findSymbolImage(priceChange: coinData.market_cap_change_24h), tintColors: findArrowColor(trangleName: findSymbolImage(priceChange: coinData.market_cap_change_24h)))
        
    }
}
