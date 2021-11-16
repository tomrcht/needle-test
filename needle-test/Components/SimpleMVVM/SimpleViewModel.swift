//
//  SimpleViewModel.swift
//  needle-test
//
//  Created by Tom Rochat on 16/11/2021.
//

import Foundation
import Combine
import UIKit

struct SimpleViewModel: ConnectedViewModel {
    let builder: SimpleBuilder

    var bag = Set<AnyCancellable>()
    let router = PassthroughSubject<RouterEvent, Never>()

    func pushSecond() {
        let vc = builder.simpleSecondViewController
        router.send(.push(vc))
    }

    mutating func dispose() {
        bag.forEach { $0.cancel() }
        bag.removeAll()
    }
}
