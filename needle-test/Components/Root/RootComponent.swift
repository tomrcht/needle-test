//
//  RootComponent.swift
//  needle-test
//
//  Created by Tom Rochat on 24/07/2021.
//

import Foundation
import UIKit
import NeedleFoundation

final class RootComponent: BootstrapComponent {
    var initialColor: UIColor {
        UIColor.systemPurple
    }

    var rootViewController: UIViewController {
        RootViewController(
            squareBuilder: squareComponent,
            imageBuilder: imageComponent,
            simpleBuilder: simpleComponent)
    }

    var squareComponent: SquareComponent {
        SquareComponent(parent: self)
    }

    var imageComponent: ImageComponent {
        ImageComponent(parent: self)
    }

    var simpleComponent: SimpleComponent {
        SimpleComponent(parent: self)
    }
}
