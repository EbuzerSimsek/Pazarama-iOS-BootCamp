//
//  CustomTabBar.swift
//  scrollViewProgrammatic
//
//  Created by Ebuzer Şimşek on 24.10.2023.
//

import UIKit

class CustomTabBar: UITabBarController {
    
    var firstViewController = MenuVC()
    var secondViewController = OffersVC()
    var thirdViewController = ProfileVC()
    var fourthViewController = MoreVC()
    
    
    let selectedColor = UIColor.orange
    let unselectedColor = UIColor.gray
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [firstViewController, secondViewController, thirdViewController, fourthViewController]
        self.viewControllers = viewControllers
        tabBar.backgroundColor = .white
        setupTabbar()
    }
    
    
    func setupTabbar(){
        
        firstViewController.title = "Menu"
        secondViewController.title = "Offers"
        thirdViewController.title = "Profile"
        fourthViewController.title = "More"
        
        
        firstViewController.tabBarItem.image = UIImage(named: "menu")!
        secondViewController.tabBarItem.image = UIImage(named: "offer")!
        thirdViewController.tabBarItem.image = UIImage(named: "profile")!
        fourthViewController.tabBarItem.image = UIImage(named: "more")!
        
        
        tabBar.tintColor = selectedColor
        tabBar.unselectedItemTintColor = unselectedColor
        let appearance = UITabBarAppearance()
        
        appearance.stackedLayoutAppearance.selected.iconColor = .orange
        appearance.stackedLayoutAppearance.normal.iconColor = .lightGray
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.orange]
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.lightGray]
        
        tabBar.standardAppearance = appearance
        tabBar.scrollEdgeAppearance = appearance
        
        let bottomLine = UIView()
        bottomLine.backgroundColor = UIColor.lightGray
        bottomLine.frame = CGRect(x: 0, y: tabBar.frame.size.height - 50, width: tabBar.frame.width, height: 1)
        tabBar.addSubview(bottomLine)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        tabBar.frame.size.height = 90
        tabBar.frame.origin.y = view.frame.height - 90
    }
}
