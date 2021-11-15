//
//  SimpleSecondViewController.swift
//  needle-test
//
//  Created by Tom Rochat on 15/11/2021.
//

import UIKit

final class SimpleSecondViewController: UIViewController {
    // MARK: - UI
    private lazy var label: UILabel = {
        let lbl = UILabel()
        lbl.text = "Hi!"
        lbl.textColor = .black
        lbl.font = .systemFont(ofSize: 24, weight: .light)
        return lbl
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
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
