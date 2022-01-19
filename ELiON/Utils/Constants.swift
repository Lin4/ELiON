//
//  Constants.swift
//  ELiON
//
//  Created by Lingeswaran Kandasamy on 11/2/21.
//

import UIKit

enum URLS {
    static let coinDetailURL = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false"
    static let coinDataModelURL = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h"
}

enum Images {
    static let placeHolder              = UIImage(named: "avatar-placeholder")
    static let ghLogo                   = UIImage(named: "gb-logo")
    static let emptyState               = UIImage(named: "empty-state-logo")
}


enum SFSymbols {
    static let arrowUP      = UIImage(systemName: "triangle.fill")
    static let arrowDown    = UIImage(systemName: "arrowtriangle.down.fill")
    static let gists        = UIImage(systemName: "text.alignleft")
    static let followers    = UIImage(systemName: "heart")
    static let following    = UIImage(systemName: "person.2")
}



