//
//  ImageViewController.swift
//  needle-test
//
//  Created by Tom Rochat on 24/07/2021.
//

import UIKit
import SnapKit
import Combine

final class ImageViewController: UIViewController, ConnectedViewController, RoutableViewController {
    // MARK: - UI
    private lazy var imageView: UIImageView = {
        let imgView = UIImageView(image: UIImage(named: "error500")!)
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()

    let viewModel: ImageViewModel
    var bag = Set<AnyCancellable>()

    // MARK: - Lifecycle
    init(viewModel: ImageViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) not implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        bindViewModel()
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

    func bindViewModel() {
        viewModel.router
            .sink { [unowned self] event in
                self.onRouterEvent(event)
            }
            .store(in: &bag)
    }

    func onRouterEvent(_ event: RouterEvent) {
        if case let .push(vc) = event {
            navigationController?.pushViewController(vc, animated: true)
        }
    }

    @objc
    private func onTap(_ sender: UITapGestureRecognizer) {
        let tapLocation = sender.location(in: imageView)
        if tapLocation.x < 150 && tapLocation.y < 200 {
            viewModel.showHiddenController()
        }
    }
}
