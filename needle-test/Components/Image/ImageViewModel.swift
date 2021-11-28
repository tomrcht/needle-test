//
//  ImageViewModel.swift
//  needle-test
//
//  Created by Tom Rochat on 28/11/2021.
//

import Foundation
import Combine

final class ImageViewModel: ConnectedViewModel, RoutingViewModel {
    let router = PassthroughSubject<RouterEvent, Never>()
    var bag = Set<AnyCancellable>()

    let builder: ImageBuilder

    init(builder: ImageBuilder) {
        self.builder = builder
    }

    func showHiddenController() {
        let vc = builder.hiddenImageViewController
        router.send(.push(vc))
    }
}
