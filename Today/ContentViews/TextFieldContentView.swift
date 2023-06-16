//
//  TextViewContentView.swift
//  Today
//
//  Created by Lee Yan Cheng on 15/6/23.
//

import UIKit

class TextFieldContentView: UIView, UIContentView {
    struct Configuration: UIContentConfiguration {
        var text: String? = ""
        // onChange handler
        var onChange: (String) -> Void = { _ in }
        
        func makeContentView() -> UIView & UIContentView {
            return TextFieldContentView(self)
        }
    }
    
    let textField = UITextField()
    var configuration: UIContentConfiguration {
        // whenever the configuration changes, need to update the UI to reflect the current state
        didSet {
            configure(configuration: configuration)
        }
    }
    
    override var intrinsicContentSize: CGSize {
        CGSize(width: 0, height: 44)
    }
    
    init(_ configuration: UIContentConfiguration) {
        self.configuration = configuration
        super.init(frame: .zero)
        // pin text field to top of superview and has horizontal padding of 16;
        // top and bottom insets of 0 force the text field to span the entire height of the superview
        addPinnedSubview(textField, insets: UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16))
        // the view calls didChange selector whenever the control detects a user interaction
        textField.addTarget(self, action: #selector(didChange(_:)), for: .editingChanged)
        // direct the text field to display a Clear Text button on its trailing side when it has contents
        textField.clearButtonMode = .whileEditing
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(configuration: UIContentConfiguration) {
        guard let configuration = configuration as? Configuration else { return }
        textField.text = configuration.text
    }
    
    @objc private func didChange(_ sender: UITextField) {
        guard let configuration = configuration as? TextFieldContentView.Configuration else { return }
        configuration.onChange(textField.text ?? "")
    }
}

extension UICollectionViewListCell {
    func textFieldConfiguration() -> TextFieldContentView.Configuration {
        TextFieldContentView.Configuration()
    }
}
