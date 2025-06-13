//
//  RoundedTabBar.swift
//  NapWise
//
//  Created by Misha Kandaurov on 10.06.2025.
//

import UIKit

class RoundedTabBar: UITabBar {
    private let customBackgroundView = UIView()

    override func layoutSubviews() {
        super.layoutSubviews()

        let height = bounds.height + 20
        let yOffset: CGFloat = -20

        customBackgroundView.frame = CGRect(x: 0, y: yOffset, width: bounds.width, height: height)
        customBackgroundView.backgroundColor = UIColor(named: "TabBarСolor")

        customBackgroundView.layer.cornerRadius = 24
        customBackgroundView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        customBackgroundView.layer.masksToBounds = true

        if customBackgroundView.superview == nil {
            insertSubview(customBackgroundView, at: 0)
        }

        customBackgroundView.layer.shadowColor = UIColor.black.cgColor
        customBackgroundView.layer.shadowOpacity = 0.15
        customBackgroundView.layer.shadowOffset = CGSize(width: 0, height: -4)
        customBackgroundView.layer.shadowRadius = 10
        customBackgroundView.layer.masksToBounds = false
    }
}

class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setValue(RoundedTabBar(), forKey: "tabBar")
        setupAppearance()
    }

    private func setupAppearance() {
        let appearance = UITabBarAppearance()
        appearance.configureWithTransparentBackground()
        tabBar.standardAppearance = appearance
        tabBar.scrollEdgeAppearance = appearance

        tabBar.barTintColor = UIColor(named: "TabBarBackground")
        tabBar.tintColor = UIColor.white
        tabBar.unselectedItemTintColor = UIColor.lightGray
        tabBar.isTranslucent = true
    }
}
