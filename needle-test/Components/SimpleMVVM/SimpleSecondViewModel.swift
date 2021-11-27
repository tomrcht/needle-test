//
//  SimpleSecondViewModel.swift
//  needle-test
//
//  Created by Tom Rochat on 16/11/2021.
//

import Foundation
import Combine
import UIKit

final class SimpleSecondViewModel: ConnectedViewModel {
    let currentColor = CurrentValueSubject<UIColor, Never>(.black)

    let builder: SimpleBuilder
    var bag = Set<AnyCancellable>()

    private var currentColorIndex = 0
    private let colors: [UIColor] = [
        .systemMint,
        .systemRed,
        .systemCyan,
        .systemPink,
        .systemPurple,
    ]

    init(builder: SimpleBuilder) {
        self.builder = builder
        print("🟢 INIT \(self)")
    }

    deinit {
        print("🔴 DEINIT \(self)")
    }

    func changeColor() {
        if currentColorIndex >= colors.count {
            currentColorIndex = 0
        }

        let newColor = colors[currentColorIndex]
        currentColor.send(newColor)
        currentColorIndex += 1
    }
}
