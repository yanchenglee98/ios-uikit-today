//
//  ViewController.swift
//  Today
//
//  Created by Lee Yan Cheng on 13/6/23.
//

import UIKit

class ReminderListViewController: UICollectionViewController {
    var dataSource: DataSource!
    
    // to configure snapshots and collection view cells
    var reminders: [Reminder] = Reminder.sampleData

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let listLayout = listLayout()
        collectionView.collectionViewLayout = listLayout
        
        // cell registration specifies how to configure the content and appearance of a cell
        let cellRegistration = UICollectionView.CellRegistration(handler: cellRegistrationHandler)
        
        dataSource = DataSource(collectionView: collectionView) {
            (collectionView: UICollectionView, indexPath: IndexPath, itemIdentifier: Reminder.ID) in
            // Reusing cells allows your app to perform well even with a vast number of items.
            return collectionView.dequeueConfiguredReusableCell(
                using: cellRegistration, for: indexPath, item: itemIdentifier)
        }
        
        updateSnapshot()
        
        collectionView.dataSource = dataSource
    }

    /*
     When a user taps a list cell, the tap can change the cell to a selected mode or initiate some other behavior.
     Since not showing the item that user tapped is selected, return false
     */
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        let id = reminders[indexPath.item].id
        // push the detail view controller to the navigation stack, causing the detail view to push onto the screen
        pushDetailViewForReminder(withId: id)
        return false
    }
    
    func pushDetailViewForReminder(withId id: Reminder.ID) {
        let reminder = reminder(withId: id)
        let viewController = ReminderViewController(reminder: reminder)
        // push the view controller onto the navigation controller stack
        navigationController?.pushViewController(viewController, animated: true)
    }

    // creates a new list configuration variable with the grouped appearance.
    private func listLayout() -> UICollectionViewCompositionalLayout {
        // UICollectionLayoutListConfiguration creates a section in a list layout.
        var listConfiguration = UICollectionLayoutListConfiguration(appearance: .grouped)
        // Disable separators, and change the background color to clear.
        listConfiguration.showsSeparators = false
        listConfiguration.backgroundColor = .clear
        // Return a new compositional layout with the list configuration.
        return UICollectionViewCompositionalLayout.list(using: listConfiguration)
    }
}

