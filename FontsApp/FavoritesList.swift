//
//  FavoritesList.swift
//  FontsApp
//
//  Created by Oguz Bayral on 17.11.2018.
//  Copyright © 2018 CentennialCollege. All rights reserved.
//

import Foundation
import UIKit

class FavoritesList{
    static let sharedFavoritesList = FavoritesList()
    private (set) var favorites:[String]

    init(){
        let defaults = UserDefaults.standard
        let storedFavorites = defaults.object(forKey: "favorites") as? [String]
        favorites = storedFavorites != nil ?  storedFavorites! : []
    }
    func addFavorite(fontName: String){
        if !favorites.contains(fontName){
                favorites.append(fontName)
                saveFavorites()
        }
    }
    func removeFavorite(fontName: String){
        if let index = favorites.index(of: fontName){
            favorites.remove(at: index)
            saveFavorites()
        }
    }
    func saveFavorites(){
        let defaults = UserDefaults.standard
        defaults.set(favorites, forKey: "favorites")
        defaults.synchronize()
    }
    

}
