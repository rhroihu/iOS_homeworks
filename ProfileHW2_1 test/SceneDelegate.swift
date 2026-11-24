//
//  SceneDelegate.swift
//  ProfileHW2_1 test
//
//  Created by Вячеслав Рудак on 10.11.2026.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    // MARK: - Scene lifecycle

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        setupWindow(with: windowScene)
    }

    // MARK: - Private methods

    private func setupWindow(with windowScene: UIWindowScene) {
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = makeTabBarController()
        window.makeKeyAndVisible()

        self.window = window
    }

    private func makeTabBarController() -> UITabBarController {
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [
            makeFeedViewController(),
            makeProfileViewController()
        ]
        return tabBarController
    }

    private func makeFeedViewController() -> UIViewController {
        let feedViewController = FeedViewController()
        feedViewController.tabBarItem = UITabBarItem(
            title: "Feed",
            image: UIImage(systemName: "house"),
            selectedImage: UIImage(systemName: "house.fill")
        )
        return feedViewController
    }

    private func makeProfileViewController() -> UIViewController {
        let profileViewController = ProfileViewController()
        profileViewController.tabBarItem = UITabBarItem(
            title: "Profile",
            image: UIImage(systemName: "person"),
            selectedImage: UIImage(systemName: "person.fill")
        )
        return UINavigationController(rootViewController: profileViewController)
    }
}
