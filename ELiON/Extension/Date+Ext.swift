//
//  Date+Ext.swift
//  ELiON
//
//  Created by Lingeswaran Kandasamy on 11/6/21.
//

import Foundation

extension Date {
    
        func convertToMonthYearFormat() -> String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMM yyyy"
            return dateFormatter.string(from: self)
        }
        
    }
