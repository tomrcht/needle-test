//
//  SimpleSecondViewController.swift
//  needle-test
//
//  Created by Tom Rochat on 15/11/2021.
//

import UIKit
import Combine

final class SimpleSecondViewController: UIViewController, ConnectedViewController {
    // MARK: - UI
    private lazy var label: UILabel = {
        let lbl = UILabel()
        lbl.text = "Hi!"
        lbl.textColor = .black
        lbl.font = .systemFont(ofSize: 24, weight: .light)
        return lbl
    }()

    // MARK: - ViewModel
    let viewModel: SimpleSecondViewModel
    var bag = Set<AnyCancellable>()

    // MARK: - Lifecycle
    init(viewModel: SimpleSecondViewModel) {
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
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }

        bindViewModel()
    }

    func bindViewModel() {
        viewModel.router.sink(receiveValue: onRouterEvent).store(in: &bag)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        bindViewModel()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }

    func dispose() {
        bag.dispose()
        viewModel.dispose()
    }

    func onRouterEvent(_ event: RouterEvent) { }
}
