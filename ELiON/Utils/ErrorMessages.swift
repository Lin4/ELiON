//
//  ErrorMessages.swift
//  ELiON
//
//  Created by Lingeswaran Kandasamy on 11/2/21.
//

import Foundation

enum ELErrors: String, Error {
    
    case invalidURL = "this URL created an invalid request. Please try again"
    case unableToComplete = "unable to complete your request. Please check your internet connection"
    case invalidResponse = "invalid response from the server. Please try again."
    case invalidData = "The data received from the server is invalid. Please try again."
    case unableToFavorite   = "There was an error favoriting this user. Please try again."
    case alreadyInFavorites = "You've already favorited this user. You must REALLY like them!"
    
}
