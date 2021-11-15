//
//  SimpleViewController.swift
//  needle-test
//
//  Created by Tom Rochat on 15/11/2021.
//

import UIKit
import SnapKit

final class SimpleViewController: UIViewController {
    // MARK: - UI
    private lazy var navigationButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Go !", for: .normal)
        btn.setTitleColor(.systemPink, for: .normal)
        btn.addTarget(self, action: #selector(moveToSecondVC), for: .touchUpInside)
        return btn
    }()

    // MARK: - Lifecycle
    convenience init() {
        self.init(nibName: nil, bundle: nil)
        print("INIT \(self)")
    }

    deinit {
        print("DEINIT \(self)")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        view.addSubview(navigationButton)
        navigationButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }

    // MARK: - Actions
    @objc
    private func moveToSecondVC() {
        let vc = SimpleSecondViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
