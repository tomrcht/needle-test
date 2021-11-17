//
//  SimpleSecondViewModel.swift
//  needle-test
//
//  Created by Tom Rochat on 16/11/2021.
//

import Foundation
import Combine

final class SimpleSecondViewModel: ConnectedViewModel {
    let builder: SimpleBuilder

    var bag = Set<AnyCancellable>()
    let router = PassthroughSubject<RouterEvent, Never>()

    init(builder: SimpleBuilder) {
        self.builder = builder
    }

    func dispose() {
        bag.dispose()
    }
}
