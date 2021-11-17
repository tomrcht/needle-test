//
//  Set.swift
//  needle-test
//
//  Created by Tom Rochat on 17/11/2021.
//

import Foundation
import Combine

extension Set where Element: AnyCancellable {
    mutating func dispose() {
        forEach { $0.cancel() }
        removeAll()
    }
}
