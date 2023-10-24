//
//  KitchenTypes.swift
//  scrollViewProgrammatic
//
//  Created by Ebuzer Şimşek on 23.10.2023.
//

import Foundation

class KitchenTypes {
    var title: String
    var imageName: String
    
    init(title: String, imageName: String) {
        self.title = title
        self.imageName = imageName
    }
}

// MARK: - Singleton Pattern
class KitchenTypesShared {
    static let shared = KitchenTypesShared(KitchenTypesDatas: [
        KitchenTypes(title: "Offers", imageName: "offers"),
        KitchenTypes(title: "Turkish", imageName: "turkish"),
        KitchenTypes(title: "Indian", imageName: "indian"),
        KitchenTypes(title: "China", imageName: "china"),
        KitchenTypes(title: "Sri Lankan", imageName: "SriLankan"),
        KitchenTypes(title: "Italian", imageName: "Italian"),
    ])
    
    var KitchenTypesDatas : [KitchenTypes]
    
    private init(KitchenTypesDatas: [KitchenTypes]) {
        self.KitchenTypesDatas = KitchenTypesDatas
    }
}
