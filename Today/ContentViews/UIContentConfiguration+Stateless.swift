//
//  UIContentConfiguration+Stateless.swift
//  Today
//
//  Created by Lee Yan Cheng on 15/6/23.
//

import UIKit

extension UIContentConfiguration {
    // UIContentConfiguration protocol requires the makeContentView and updated methods
    func updated(for state: UIConfigurationState) -> Self {
        return self
    }
}
