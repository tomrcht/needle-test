//
//  RootViewController.swift
//  needle-test
//
//  Created by Tom Rochat on 24/07/2021.
//

import UIKit

final class RootViewController: UITabBarController {
    // MARK: - Lifecycle
    init(squareBuilder: SquareBuilder,
         imageBuilder: ImageBuilder) {
        print("INIT RootViewController")
        super.init(nibName: nil, bundle: nil)

        let squareVC = squareBuilder.squareViewController
        squareVC.tabBarItem = UITabBarItem(title: "Square",
                                           image: UIImage(systemName: "square"),
                                           selectedImage: UIImage(systemName: "square.fill"))

        let imageVC = imageBuilder.imageViewController
        imageVC.tabBarItem = UITabBarItem(title: "Image",
                                          image: UIImage(systemName: "photo"),
                                          selectedImage: UIImage(systemName: "photo.fill"))

        viewControllers = [
            squareVC,
            UINavigationController(rootViewController: imageVC),
        ]
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) not implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    private func setup() {
        tabBar.isTranslucent = true
        tabBar.tintColor = .systemRed
    }

    deinit { print("DEINIT \(self)") }
}
