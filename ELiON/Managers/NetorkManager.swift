//
//  NetorkManager.swift
//  ELiON
//
//  Created by Lingeswaran Kandasamy on 11/2/21.
//

import UIKit

class NetworkManager {
    
    static let shared   = NetworkManager()
    let cache           = NSCache<NSString, UIImage>()
    let decoder         = JSONDecoder()
    
    private init() {
        decoder.keyDecodingStrategy  = .useDefaultKeys
        decoder.dateDecodingStrategy = .iso8601
    }

    
    func getCoinData() async throws -> [CoinMarketData] {
        
        guard let url = URL(string: URLS.coinDetailURL) else {
            throw ELErrors.invalidURL
        }
        
        let (data, response ) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw ELErrors.invalidResponse
        }
        
        do {
            return try decoder.decode([CoinMarketData].self, from: data)
        } catch {
            throw ELErrors.invalidData
        }
    }
    
    

    func downloadImage(from urlString: String) async -> UIImage? {
        let cacheKey = NSString(string: urlString)
        if let image = cache.object(forKey: cacheKey) { return image}
        guard let url = URL(string: urlString) else{ return nil}
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            guard let image = UIImage(data: data) else { return nil }
            cache.setObject(image, forKey: cacheKey)
            return image
        } catch {
            return nil
        }
    }
    
}

