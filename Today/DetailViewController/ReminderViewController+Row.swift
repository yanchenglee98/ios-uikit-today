//
//  ReminderViewController+Row.swift
//  Today
//
//  Created by Lee Yan Cheng on 14/6/23.
//

import UIKit

extension ReminderViewController {
    /*
     diffable data source requires items to conform to hashable
     diffable data source use hash values to determine which elements have changed between snapshot
     */
    enum Row: Hashable {
        case header(String)
        case date
        case notes
        case time
        case title
        
        // returns appropriate SF symbol name for each case
        var imageName: String? {
            switch self {
            case .date: return "calendar.circle"
            case .notes: return "square.and.pencil"
            case .time: return "clock"
            default: return nil
            }
        }
        
        var image: UIImage? {
            guard let imageName = imageName else { return nil }
            let configuration = UIImage.SymbolConfiguration(textStyle: .headline)
            return UIImage(systemName: imageName, withConfiguration: configuration)
        }
        
        var textStyle: UIFont.TextStyle {
            switch self {
            case .title: return .headline
            default: return .subheadline
            }
        }
    }
}
