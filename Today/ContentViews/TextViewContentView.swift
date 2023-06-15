//
//  TextViewContentView.swift
//  Today
//
//  Created by Lee Yan Cheng on 15/6/23.
//

import UIKit

class TextViewContentView: UIView, UIContentView {
    struct Configuration: UIContentConfiguration {
        var text: String? = ""
        
        func makeContentView() -> UIView & UIContentView {
            return TextViewContentView(self)
        }
    }
    
    let textView = UITextView()
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
        addPinnedSubview(textView, height: 200)
        textView.backgroundColor = nil
        textView.font = UIFont.preferredFont(forTextStyle: .body)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(configuration: UIContentConfiguration) {
        guard let configuration = configuration as? Configuration else { return }
        textView.text = configuration.text
    }
}

extension UICollectionViewListCell {
    func textViewConfiguration() -> TextViewContentView.Configuration {
        TextViewContentView.Configuration()
    }
}
