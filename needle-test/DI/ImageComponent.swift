//
//  ImageComponent.swift
//  needle-test
//
//  Created by Tom Rochat on 24/07/2021.
//

import Foundation
import UIKit
import NeedleFoundation

protocol ImageBuilder {
    var imageViewController: UIViewController { get }
    var hiddenImageViewController: UIViewController { get }
}

final class ImageComponent: Component<EmptyDependency>, ImageBuilder {
    var imageViewController: UIViewController {
        ImageViewController()
    }

    var hiddenImageViewController: UIViewController {
        HiddenImageViewController(image: UIImage(named: "error500")!)
    }
}
