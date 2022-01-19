//
//  CWTabBarController.swift
//  ELiON
//
//  Created by Lingeswaran Kandasamy on 11/2/21.
//

import UIKit

class CWTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().tintColor = .systemGreen
        viewControllers = [createHomeNC(), createMainNC(), createCardNC(), createAccountNC(), createTrackNC()]
        
    }
    
    func createHomeNC() -> UINavigationController {
        
        let homeVC = HomeVC()
        homeVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        return UINavigationController(rootViewController: homeVC)
        
    }
    
    func createMainNC() -> UINavigationController {
        let mainVC = MainVC()
        mainVC.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 0)
        return UINavigationController(rootViewController: mainVC)
    }
    
    func createAccountNC() -> UINavigationController {
        let accounVC = AccountVC()
        accounVC.tabBarItem = UITabBarItem(tabBarSystemItem: .topRated, tag: 2)
        return UINavigationController(rootViewController: accounVC)
        }
    
    func createTrackNC() -> UINavigationController {
        let trackVC = TrackVC()
        trackVC.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 3)
        return UINavigationController(rootViewController: trackVC)
    }
    
    func createCardNC() -> UINavigationController {
        let cardVC = CardVC()
        cardVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 4)
        return UINavigationController(rootViewController: cardVC)
    }

}
