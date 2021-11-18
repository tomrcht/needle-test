//
//  SimpleViewController.swift
//  needle-test
//
//  Created by Tom Rochat on 15/11/2021.
//

import UIKit
import SnapKit
import Combine

final class SimpleViewController: UIViewController, ConnectedViewController, Routable {
    // MARK: - UI
    private lazy var navigationButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Go !", for: .normal)
        btn.setTitleColor(.systemPink, for: .normal)
        btn.addTarget(self, action: #selector(moveToSecondVC), for: .touchUpInside)
        return btn
    }()

    // MARK: - ViewModel
    let viewModel: SimpleViewModel
    var bag = Set<AnyCancellable>()

    // MARK: - Lifecycle
    init(viewModel: SimpleViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)

        print("🟢 INIT \(self)")
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    deinit {
        print("🔴 DEINIT \(self)")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        view.addSubview(navigationButton)
        navigationButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        bindViewModel()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        dispose()
    }

    func bindViewModel() {
        viewModel.router.sink(receiveValue: onRouterEvent).store(in: &bag)
    }

    func dispose() {
        bag.dispose()
        viewModel.dispose()
    }

    // MARK: - Events
    func onRouterEvent(_ event: RouterEvent) {
        if case let .push(vc) = event {
            navigationController?.pushViewController(vc, animated: true)
        }
    }

    @objc
    private func moveToSecondVC() {
        viewModel.pushSecond()
    }
}
