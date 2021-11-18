//
//  SimpleViewModel.swift
//  needle-test
//
//  Created by Tom Rochat on 16/11/2021.
//

import Foundation
import Combine
import UIKit

final class SimpleViewModel: ConnectedViewModel, RoutingViewModel {
    let builder: SimpleBuilder

    var bag = Set<AnyCancellable>()
    let router = PassthroughSubject<RouterEvent, Never>()

    init(builder: SimpleBuilder) {
        self.builder = builder
        print("🟢 INIT \(self)")
    }

    deinit {
        print("🔴 DEINIT \(self)")
    }

    func pushSecond() {
        let vc = builder.simpleSecondViewController
        router.send(.push(vc))
    }

    func dispose() {
        bag.dispose()
    }
}
