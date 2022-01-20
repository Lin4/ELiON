//
//  ELAditionalCoinInfoVCTwo.swift
//  ELiON
//
//  Created by Lingeswaran Kandasamy on 1/19/22.
//

import UIKit

class ELAditionalCoinInfoVCTwo: ELDetailKeyStatsInfoVC {

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
        
        detailStatsViewOne.set(aditionalDetails: .highIn24, coinData: "\(coinData.high_24h.doubleToCurrencyWith2Decimal())")
        
        guard let valueation = coinData.low_24h else { return }
        
        detailStatsViewTwo.set(aditionalDetails: .lowIn24, coinData: "\(valueation.doubleToCurrencyWith2Decimal())")
        
    }

}
