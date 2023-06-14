//
//  ReminderListViewController+Actions.swift
//  Today
//
//  Created by Lee Yan Cheng on 14/6/23.
//

import UIKit

extension ReminderListViewController {
    @objc func didPressDoneButton(_ sender: ReminderDoneButton) {
        guard let id = sender.id else { return }
        completeReminder(withId: id)
    }
}
