//
//  MovieAppUITests.swift
//  MovieAppUITests
//
//  Created by Ebuzer Şimşek on 6.11.2023.
//

import XCTest

final class MovieAppUITests: XCTestCase {

    

        func testExample() throws {
            
         let app = XCUIApplication()
         let searchBar = app.searchFields["Search"]
         let firstRow = app.tables.children(matching: .cell).element(boundBy: 1).children(matching: .other).element(boundBy: 0)
         let detailsVCBackButton = app.buttons["←"]
         
        
            
         app.launch()
         searchBar.tap()
         searchBar.typeText("kurtlar")
         firstRow.tap()
         detailsVCBackButton.tap()
                                
        
        
                
        
        
       

       
    }

    
}
