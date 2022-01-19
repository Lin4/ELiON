//
//  MainVC.swift
//  ELiON
//
//  Created by Lingeswaran Kandasamy on 11/2/21.
//

import UIKit

class MainVC: UIViewController {
    
    var coinChartDatas: [Any] = []
    
    let scrollView  = UIScrollView()
    let contentView = UIView()
    
    
    let headerView  = UIView()
    let bodyViewOne = UIView()
    let bodyViewTwo = UIView()
    let FooterView  = UIView()
    var itemViews: [UIView] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureScrollView()
        layoutUI()
    }
    
    func configureViewController() {
        view.backgroundColor = .systemBackground
    }

    
    func configureScrollView(){
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        scrollView.pinToEdges(of: view)
        contentView.pinToEdges(of: scrollView)
        
        NSLayoutConstraint.activate([
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.heightAnchor.constraint(equalToConstant: 800)
        ])
    }
    
    
    
    func initProduct(coinMarketData: CoinMarketData) {
        self.add(childVC: ELHeaderVC(coinData: coinMarketData), to: self.headerView)
        self.add(childVC: ELCoinDetaiVC(coinData: coinMarketData), to: self.bodyViewOne)
        self.add(childVC: ELCoinPriceChangePercentage(coinData: coinMarketData), to: self.bodyViewTwo)
    }
    
  
    
    func add(childVC: UIViewController, to containerView: UIView) {
        addChild(childVC)
        containerView.addSubview(childVC.view)
        childVC.view.frame = containerView.bounds
        childVC.didMove(toParent: self)
    }
    
    func layoutUI() {
        
        let padding: CGFloat = 20
        let itemHeight: CGFloat = 100
        
        itemViews = [headerView, bodyViewOne, bodyViewTwo, FooterView]
        
        for itemView in itemViews {
            contentView.addSubview(itemView)
            itemView.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                itemView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
                itemView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding)
            ])
        }
        
        headerView.backgroundColor = .systemBackground

        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            headerView.heightAnchor.constraint(equalToConstant: itemHeight),
            
            
            bodyViewOne.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 60),
            bodyViewOne.heightAnchor.constraint(equalToConstant: itemHeight),
            
            
            bodyViewTwo.topAnchor.constraint(equalTo: bodyViewOne.bottomAnchor, constant: padding),
            bodyViewTwo.heightAnchor.constraint(equalToConstant: itemHeight),
            
            FooterView.topAnchor.constraint(equalTo: bodyViewTwo.bottomAnchor, constant: padding),
            FooterView.heightAnchor.constraint(equalToConstant: 50)
        
        ])
        
        
    }
    
    
}
