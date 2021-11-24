//
//  SimpleSecondViewController.swift
//  needle-test
//
//  Created by Tom Rochat on 15/11/2021.
//

import UIKit
import Combine

final class SimpleSecondViewController: UIViewController, ConnectedViewController, RoutableViewController {
    // MARK: - UI
    private lazy var colorButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Change color !", for: .normal)
        btn.setTitleColor(.systemPink, for: .normal)
        btn.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
        return btn
    }()
    private lazy var square: UIView = {
        let square = UIView(frame: .zero)
        square.backgroundColor = .black
        return square
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

    deinit { print("🔴 DEINIT \(self)") }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        view.addSubview(colorButton)
        colorButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }

        view.addSubview(square)
        square.snp.makeConstraints { make in
            make.width.height.equalTo(100)
            make.centerX.equalToSuperview()
            make.top.equalTo(colorButton.snp.bottom).offset(16)
        }

        bindViewModel()
    }

    func bindViewModel() {
        viewModel.router.sink { [unowned self] event in
            self.onRouterEvent(event)
        }.store(in: &bag)

        viewModel.currentColor
            .sink { [unowned self] newColor in
                self.square.backgroundColor = newColor
            }
            .store(in: &bag)
    }

    func onRouterEvent(_ event: RouterEvent) {
        print("???")
    }

    // MARK: - Events and actions
    @objc
    private func changeColor() {
        viewModel.changeColor()
    }
}
