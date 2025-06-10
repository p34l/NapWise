//
//  EntryFactory.swift
//  NapWise
//
//  Created by Misha Kandaurov on 01.06.2025.
//

import UIKit

class EntryFactory {
    static func makeMainTabBarController() -> UITabBarController {
        let tabBarController = MainTabBarController()

        let entryVC = makeEntryVC()
        entryVC.tabBarItem = UITabBarItem(
            title: "",
            image: UIImage(systemName: "house"),
            selectedImage: UIImage(systemName: "house.fill"),
        )

        let alarmVC = makeAlarmVC()
        alarmVC.tabBarItem = UITabBarItem(
            title: "",
            image: UIImage(systemName: "alarm"),
            selectedImage: UIImage(systemName: "alarm.fill"),
        )

        let historyVC = makeHistoryVC()
        historyVC.tabBarItem = UITabBarItem(
            title: "",
            image: UIImage(systemName: "clock.arrow.circlepath"),
            selectedImage: UIImage(systemName: "clock.arrow.trianglehead.2.counterclockwise.rotate.90"),
        )

        let infoVC = makeInfoVC()
        infoVC.tabBarItem = UITabBarItem(
            title: "",
            image: UIImage(systemName: "info.circle"),
            selectedImage: UIImage(systemName: "info.circle.fill"),
        )

        tabBarController.viewControllers = [
            UINavigationController(rootViewController: entryVC),
            UINavigationController(rootViewController: alarmVC),
            UINavigationController(rootViewController: historyVC),
            UINavigationController(rootViewController: infoVC),
        ]

        return tabBarController
    }

    static func makeEntryVC() -> UIViewController {
        let viewModel = EntryViewModel()
        let router = EntryRouter()
        let viewController = EntryViewController(viewModel: viewModel)

        viewModel.router = router
        return viewController
    }

    static func makeAlarmVC() -> UIViewController {
        AlarmViewController()
    }

    static func makeHistoryVC() -> UIViewController {
        HistoryViewController()
    }

    static func makeInfoVC() -> UIViewController {
        InfoViewController()
    }
}
