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
    
    
    let headerView      = UIView()
    let bodyViewOne     = UIView()
    let bodyViewTwo     = UIView()
    let bodyViewThree   = UIView()
    let bodyViewFour    = UIView()
    let bodyViewFive    = UIView()
    let bodyViewSix     = UIView()
   
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
            contentView.heightAnchor.constraint(equalToConstant: 1000)
        ])
    }
    
    
    
    func initProduct(coinMarketData: CoinMarketData) {
        self.add(childVC: ELHeaderVC(coinData: coinMarketData), to: self.headerView)
        self.add(childVC: ELKeyStatsItemOneVC(coinData: coinMarketData), to: self.bodyViewOne)
        self.add(childVC: ELKeyStatsItemTwoVC(coinData: coinMarketData), to: self.bodyViewTwo)
        
        self.add(childVC: ELAditionalCoinInfoVCOne(coinData: coinMarketData), to: self.bodyViewThree)
        self.add(childVC: ELAditionalCoinInfoVCTwo(coinData: coinMarketData), to: self.bodyViewFour)
        self.add(childVC: ELAditionalCoinInfoVCThree(coinData: coinMarketData), to: self.bodyViewFive)
        self.add(childVC: ELAditionalCoinInfoVCFour(coinData: coinMarketData), to: self.bodyViewSix)
    }
    
  
    
    func add(childVC: UIViewController, to containerView: UIView) {
        addChild(childVC)
        containerView.addSubview(childVC.view)
        childVC.view.frame = containerView.bounds
        childVC.didMove(toParent: self)
    }
    
    func layoutUI() {
        
        let padding: CGFloat = 20
        let itemHeight: CGFloat = 130
        let detailItemHeight: CGFloat = 80
        
        itemViews = [headerView, bodyViewOne, bodyViewTwo, bodyViewThree, bodyViewFour, bodyViewFive, bodyViewSix]
        
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
            
            
            bodyViewOne.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 40),
            bodyViewOne.heightAnchor.constraint(equalToConstant: itemHeight),
            
            
            bodyViewTwo.topAnchor.constraint(equalTo: bodyViewOne.bottomAnchor, constant: padding),
            bodyViewTwo.heightAnchor.constraint(equalToConstant: itemHeight),
            
            bodyViewThree.topAnchor.constraint(equalTo: bodyViewTwo.bottomAnchor, constant: 40),
            bodyViewThree.heightAnchor.constraint(equalToConstant: detailItemHeight),
            
            
            bodyViewFour.topAnchor.constraint(equalTo: bodyViewThree.bottomAnchor, constant: padding),
            bodyViewFour.heightAnchor.constraint(equalToConstant: detailItemHeight),
            
            bodyViewFive.topAnchor.constraint(equalTo: bodyViewFour.bottomAnchor, constant: 40),
            bodyViewFive.heightAnchor.constraint(equalToConstant: detailItemHeight),
            
            
            bodyViewSix.topAnchor.constraint(equalTo: bodyViewFive.bottomAnchor, constant: padding),
            bodyViewSix.heightAnchor.constraint(equalToConstant: detailItemHeight),
            
           
        
        ])
        
        
    }
    
    
}
