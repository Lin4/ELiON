//
//  BodyView.swift
//  ELiON
//
//  Created by Lingeswaran Kandasamy on 1/7/22.
//

import UIKit

class ELBodyVC: UIViewController {

    var coinData: CoinMarketData!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    init(coinData: CoinMarketData) {
        super.init(nibName: nil, bundle: nil)
        self.coinData = coinData
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
        
        
 
    

 
