//
//  SquareViewController.swift
//  needle-test
//
//  Created by Tom Rochat on 24/07/2021.
//

import UIKit

final class SquareViewController: UIViewController {
    private let initialColor: UIColor

    // MARK: - Lifecycle
    init(initialColor: UIColor) {
        print("INIT SquareViewController")
        self.initialColor = initialColor
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) not implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }

    private func setup() {
        view.backgroundColor = .white

        let squareView = SquareView(color: initialColor, size: 100)
        squareView.center = view.center
        view.addSubview(squareView)
    }

    deinit { print("DEINIT \(self)") }
}
