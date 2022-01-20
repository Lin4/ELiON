//
//  ELAditionalCoinInfoVCFour.swift
//  ELiON
//
//  Created by Lingeswaran Kandasamy on 1/19/22.
//

import UIKit

class ELAditionalCoinInfoVCFour: ELDetailKeyStatsInfoVC {

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
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let date = formatter.date(from: coinData.last_updated) ?? Date()
        detailStatsViewOne.set(aditionalDetails: .lastUpdated, coinData: date.asShortDateString())
        
        guard let valueation = coinData.fully_diluted_valuation else { return }
        detailStatsViewTwo.set(aditionalDetails: .fullyDilutedCapitalization, coinData: String(valueation.doubleToCurrencyWith2Decimal()))
        
    }

}
