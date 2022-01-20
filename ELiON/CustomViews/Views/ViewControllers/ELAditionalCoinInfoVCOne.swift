//
//  ELAditionalInfoVCOne.swift
//  ELiON
//
//  Created by Lingeswaran Kandasamy on 1/19/22.
//

import UIKit

class ELAditionalCoinInfoVCOne: ELDetailKeyStatsInfoVC {

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
        
        detailStatsViewOne.set(aditionalDetails: .rank, coinData: "\(coinData.market_cap_rank)")
        
        detailStatsViewTwo.set(aditionalDetails: .totalVolume, coinData: "\(coinData.total_volume)")
        
    }

}
