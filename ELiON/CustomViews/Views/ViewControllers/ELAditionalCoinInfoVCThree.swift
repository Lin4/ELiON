//
//  ELAditionalCoinInfoVCThree.swift
//  ELiON
//
//  Created by Lingeswaran Kandasamy on 1/19/22.
//

import UIKit

class ELAditionalCoinInfoVCThree: ELDetailKeyStatsInfoVC {

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
        
        detailStatsViewOne.set(aditionalDetails: .circulatingSupply, coinData: "\(coinData.circulating_supply.doubleToCurrencyWith2Decimal())")
        
        guard let valueation = coinData.total_supply else { return }
        
        detailStatsViewTwo.set(aditionalDetails: .totalSupply, coinData: "\(valueation.doubleToCurrencyWith2Decimal())")
        
    }

}
