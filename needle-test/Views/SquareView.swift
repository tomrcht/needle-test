//
//  SquareView.swift
//  needle-test
//
//  Created by Tom Rochat on 24/07/2021.
//

import UIKit

final class SquareView: UIView {
    private var color: UIColor = .white {
        didSet {
            backgroundColor = color
        }
    }
    private var size: CGFloat = 10 {
        didSet {
            frame = CGRect(origin: previousCenter, size: CGSize(width: size, height: size))
        }
    }
    private var previousCenter: CGPoint = .zero
    private let availableColors: [UIColor] = [.systemBlue, .systemRed, .systemYellow, .systemOrange]

    // MARK: - Lifecycle
    convenience init(color: UIColor, size: CGFloat) {
        self.init(frame: .zero)

        self.color = color
        self.size = size
        setup()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) not implemented")
    }

    private func setup() {
        backgroundColor = color
        frame = CGRect(origin: .zero, size: CGSize(width: size, height: size))

        let longPressGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(move))
        addGestureRecognizer(longPressGestureRecognizer)

        let doubleTapGesture = UITapGestureRecognizer(target: self, action: #selector(changeColor))
        doubleTapGesture.numberOfTapsRequired = 2
        addGestureRecognizer(doubleTapGesture)
    }

    // MARK: - Overrides
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)

        superview?.bringSubviewToFront(self)
        previousCenter = center
    }

    // MARK: - Actions
    @objc
    private func move(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: superview)
        center = CGPoint(x: previousCenter.x + translation.x,
                         y: previousCenter.y + translation.y)
    }

    @objc
    private func changeColor() {
        color = availableColors.randomElement()!
    }
}
