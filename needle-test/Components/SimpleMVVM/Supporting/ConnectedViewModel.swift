//
//  ConnectedViewModel.swift
//  needle-test
//
//  Created by Tom Rochat on 15/11/2021.
//

import Foundation
import Combine

protocol ConnectedViewModel {
    associatedtype AnyBuilder

    var builder: AnyBuilder { get }

    var bag: Set<AnyCancellable> { get set }
    var router: PassthroughSubject<RouterEvent, Never> { get }

    /// This func should handle the teardown of the view model, such as cancelling subjects or releasing any ressources
    /// that can be disposed of
    mutating func dispose()
}
