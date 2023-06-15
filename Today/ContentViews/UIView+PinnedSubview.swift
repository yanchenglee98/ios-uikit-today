//
//  UIView+PinnedSubview.swift
//  Today
//
//  Created by Lee Yan Cheng on 15/6/23.
//

import UIKit

extension UIView {
    // add a subview that is pinned to its superview with optional padding
    func addPinnedSubview(
        _ subview: UIView, height: CGFloat? = nil,
    insets: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 8)
    ) {
        addSubview(subview)
        // prevent system from creating automatic constraints
        subview.translatesAutoresizingMaskIntoConstraints = false
        subview.topAnchor.constraint(equalTo: topAnchor, constant: insets.top).isActive = true
        // Auto Layout determines a view’s neighbors along the horizontal axis using leading and trailing instead of left and right
        subview.leadingAnchor.constraint(equalTo: leadingAnchor, constant: insets.left).isActive = true
        subview.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -1.0 * insets.right)
            .isActive = true
        subview.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -1.0 * insets.bottom)
            .isActive = true
        if let height {
            subview.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
}
