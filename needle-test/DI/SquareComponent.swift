//
//  SquareComponent.swift
//  needle-test
//
//  Created by Tom Rochat on 24/07/2021.
//

import Foundation
import UIKit
import NeedleFoundation

protocol SquareBuilder {
    var squareViewController: UIViewController { get }
}

protocol SquareDependency: Dependency {
    var initialColor: UIColor { get }
}

final class SquareComponent: Component<SquareDependency>, SquareBuilder {
    var squareViewController: UIViewController {
        SquareViewController(initialColor: dependency.initialColor)
    }
}
