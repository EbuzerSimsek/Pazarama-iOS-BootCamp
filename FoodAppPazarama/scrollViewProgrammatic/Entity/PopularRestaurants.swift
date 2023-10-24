//
//  PopularRestaurants.swift
//  scrollViewProgrammatic
//
//  Created by Ebuzer Şimşek on 23.10.2023.
//

import Foundation

class PopularRestaurants {
    var title: String
    var imageName: String
    var ranking : String
    
    
    init(title: String, imageName: String, ranking: String) {
        self.title = title
        self.imageName = imageName
        self.ranking = ranking
        
    }
}

// MARK: - Singleton Pattern
class PopularRestaurantsShared {
    static let shared = PopularRestaurantsShared(PopularRestaurantsDatas: [
        PopularRestaurants(title: "Pizza Haven", imageName: "pizza", ranking: "4.5"),
        PopularRestaurants(title: "Bamboo Garden", imageName: "breakfast", ranking: "4.8"),
        PopularRestaurants(title: "Royal Feast", imageName: "cafe", ranking: "4.1"),
        PopularRestaurants(title: "Kebap House", imageName: "kebap", ranking: "4.7"),
        PopularRestaurants(title: "Golden Fork", imageName: "healthyFood", ranking: "3.9")])
    
    var PopularRestaurantsDatas : [PopularRestaurants]
    
    private init(PopularRestaurantsDatas: [PopularRestaurants]) {
        self.PopularRestaurantsDatas = PopularRestaurantsDatas
    }
}
