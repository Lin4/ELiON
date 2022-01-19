//
//  UIViewController+EXT.swift
//  ELiON
//
//  Created by Lingeswaran Kandasamy on 11/3/21.
//

import UIKit
import SafariServices


extension UIViewController {
    
    func presentELAlert(title: String, message: String, buttonTitle: String) {
            let alertVC = ELAlertVC(title: title, message: message, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            present(alertVC, animated: true)
    }
    
    func presentDefaultError() {
        let alertVC = ELAlertVC(title: "Something Went Wrong",
                                message: "We were unable to complete your task at this time. Please try again.",
                                buttonTitle: "Ok")
        alertVC.modalPresentationStyle  = .overFullScreen
        alertVC.modalTransitionStyle    = .crossDissolve
        present(alertVC, animated: true)
    }
    
    func presentSafariVC(with url: URL) {
        let safariVC = SFSafariViewController(url: url)
        safariVC.preferredControlTintColor = .systemGreen
        present(safariVC, animated: true)
    }
    
    
    func findSymbolImage(priceChange: Double) -> String {
        let trangleUp = "triangle.fill"
        let trangleDown = "arrowtriangle.down.fill"
        return priceChange > 0 ?  trangleUp :  trangleDown
        
    }
    
    func findArrowColor(trangleName: String) -> UIColor {
        
        if trangleName == "triangle.fill" {
            return .systemGreen
        } else {
            return .systemRed
        }
    }
    
}
