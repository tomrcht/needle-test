//
//  RouterEvent.swift
//  needle-test
//
//  Created by Tom Rochat on 16/11/2021.
//

import Foundation
import UIKit

enum RouterEvent {
    case push(UIViewController)
    case present(UIViewController)
    case pop
    case dismiss
}
