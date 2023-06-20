//
//  EKEventStore+AsyncFetch.swift
//  Today
//
//  Created by Lee Yan Cheng on 19/6/23.
//

import EventKit
import Foundation

// EKEventStore can access a user's calendar and reminders
extension EKEventStore {
    // async keyword indicates that this function can execute asynchronously
    func reminders(matching predicate: NSPredicate) async throws -> [EKReminder] {
        // use continuations to wrap concurrent callback functions so that their results can be returned inline
        try await withCheckedThrowingContinuation { continuation in
            fetchReminders(matching: predicate) { reminders in
                if let reminders  {
                    continuation.resume(returning: reminders)
                } else {
                    continuation.resume(throwing: TodayError.failedReadingReminders)
                }
            }
        }
    }
}
