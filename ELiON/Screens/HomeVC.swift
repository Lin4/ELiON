//
//  HomeVC.swift
//  ELiON
//
//  Created by Lingeswaran Kandasamy on 11/2/21.
//

import UIKit

class HomeVC: UIViewController {
    enum Section { case main }
    
    var tableView = UITableView()
    var coinDatas: [CoinMarketData]  = []
    
    var filteredCoinData: [CoinMarketData] = []
    var isSearching = false
    var dataSource: UITableViewDiffableDataSource<Section, CoinMarketData>!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureTableView()
        configureSearchController()
        configureDataSource()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getCoinData()
    }
    

    func configureTableView() {
        view.addSubview(tableView)
        
        tableView.frame         = view.bounds
        tableView.rowHeight     = 100
        tableView.delegate      = self
        
        tableView.register(FeaturedCoinCell.self, forCellReuseIdentifier: FeaturedCoinCell.reuseID)
    }
    

    func getCoinData() {
        
        Task {
            do{
                let coinData = try await NetworkManager.shared.getCoinData()
                self.updateUI(with: coinData)
                
            } catch {
                if let gberror = error as? ELErrors {
                     presentELAlert(title: "Bad stuff Happened", message: gberror.rawValue, buttonTitle: "Ok")
                } else {
                      presentDefaultError()
                }
                
            }
        }
    }
    
    
    
    func configureSearchController() {
        let searchController                                    = UISearchController()
        searchController.searchResultsUpdater                   = self
        searchController.searchBar.placeholder                  = "search for a coin name"
        searchController.obscuresBackgroundDuringPresentation   = false
        navigationItem.searchController                         = searchController
    }
    
    
    func configureDataSource() {
        dataSource = UITableViewDiffableDataSource<Section, CoinMarketData> (tableView: tableView, cellProvider: {(tableView, IndexPath, coinData) -> UITableViewCell? in
            let cell = tableView.dequeueReusableCell(withIdentifier: FeaturedCoinCell.reuseID, for: IndexPath) as! FeaturedCoinCell
            
            cell.set(coinData: coinData)
            return cell
        })
        
    }
    
    
    
    func updateData(on coinDatas: [CoinMarketData]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, CoinMarketData>()
        snapshot.appendSections([.main])
        snapshot.appendItems(coinDatas)
        DispatchQueue.main.async { self.dataSource.apply(snapshot, animatingDifferences: true) }
        
    }
    
    func updateUI(with coinData: [CoinMarketData]) {
        if coinData.isEmpty {
            print("No data loded")
        } else {
            self.coinDatas = coinData
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.view.bringSubviewToFront(self.tableView)
            }
        }
        self.updateData(on: self.coinDatas)
    }
}
extension HomeVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coinDatas.count
    }
}

extension HomeVC: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let filter = searchController.searchBar.text, !filter.isEmpty else {
            filteredCoinData.removeAll()
            updateData(on: coinDatas)
            isSearching = false
            return
        }
        isSearching = true
        filteredCoinData = coinDatas.filter{$0.name.lowercased().contains(filter.lowercased())}
        updateData(on: filteredCoinData)
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let coinData = coinDatas[indexPath.row]
        let destVC = MainVC()
        destVC.initProduct(coinMarketData:  coinData)
        navigationController?.pushViewController(destVC, animated: true)
    }
}
