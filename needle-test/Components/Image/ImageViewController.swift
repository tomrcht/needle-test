//
//  ImageViewController.swift
//  needle-test
//
//  Created by Tom Rochat on 24/07/2021.
//

import UIKit
import SnapKit

final class ImageViewController: UIViewController {
    private lazy var imageView: UIImageView = {
        let imgView = UIImageView(image: UIImage(named: "error500")!)
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()

    // ⚠️ Probably the worst thing to do but I have no idea
    // on how to handle navigation right now. A Router class would be nice
    private let component: ImageComponent

    init(component: ImageComponent) {
        print("INIT ImageViewController")

        self.component = component
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
            make.leading.equalToSuperview().offset(25)
            make.trailing.equalToSuperview().offset(-25)
            make.centerY.equalToSuperview()
        }

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onTap))
        imageView.addGestureRecognizer(tapGesture)
        imageView.isUserInteractionEnabled = true
    }

    @objc
    private func onTap(_ sender: UITapGestureRecognizer) {
        let tapLocation = sender.location(in: imageView)
        if tapLocation.x < 150 && tapLocation.y < 200 {
            navigationController?.pushViewController(component.hiddenImageViewController, animated: true)
        }
    }

    deinit { print("DEINIT \(self)") }
}