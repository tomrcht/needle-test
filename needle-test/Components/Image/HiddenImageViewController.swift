//
//  HiddenImageViewController.swift
//  needle-test
//
//  Created by Tom Rochat on 24/07/2021.
//

import UIKit
import SnapKit

final class HiddenImageViewController: UIViewController {
    private let imageView: UIImageView

    // MARK: - Lifecycle
    init(image: UIImage) {
        print("INIT HiddenImageViewController")
        imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) not implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    private func setup() {
        view.backgroundColor = .white

        view.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalToSuperview()
        }
    }

    deinit { print("DEINIT \(self)") }
}
