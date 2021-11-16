//
//  SimpleComponent.swift
//  needle-test
//
//  Created by Tom Rochat on 14/11/2021.
//

import Foundation
import UIKit
import NeedleFoundation

protocol SimpleBuilder {
    var simpleViewController: UIViewController { get }
    var simpleSecondViewController: UIViewController { get }
}

final class SimpleComponent: Component<EmptyDependency>, SimpleBuilder {
    var simpleViewController: UIViewController {
        SimpleViewController(viewModel: simpleViewModel)
    }

    var simpleViewModel: SimpleViewModel {
        SimpleViewModel(builder: self)
    }

    var simpleSecondViewController: UIViewController {
        SimpleSecondViewController(viewModel: simpleSecondViewModel)
    }

    var simpleSecondViewModel: SimpleSecondViewModel {
        SimpleSecondViewModel(builder: self)
    }
}
