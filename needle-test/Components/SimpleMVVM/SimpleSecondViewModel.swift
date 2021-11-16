//
//  SimpleSecondViewModel.swift
//  needle-test
//
//  Created by Tom Rochat on 16/11/2021.
//

import Foundation
import Combine

struct SimpleSecondViewModel: ConnectedViewModel {
    let builder: SimpleBuilder

    var bag = Set<AnyCancellable>()
    let router = PassthroughSubject<RouterEvent, Never>()

    mutating func dispose() {
        bag.forEach { $0.cancel() }
        bag.removeAll()
    }
}
