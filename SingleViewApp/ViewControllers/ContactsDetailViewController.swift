//
//  ContactsDetailViewController.swift
//  SingleViewApp
//
//  Created by Денис Александров on 05.06.2024.
//

import UIKit

final class ContactsDetailViewController: UITableViewController {
    
    let dataStore = DataStore.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "detailCell")
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return dataStore.people.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2 // Email and Phone
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let person = dataStore.people[section]
        return "\(person.firstName) \(person.lastName)"
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath)
        let person = dataStore.people[indexPath.section]
        
        if indexPath.row == 0 {
            cell.textLabel?.text = "Email: \(person.email)"
        } else {
            cell.textLabel?.text = "Phone: \(person.phone)"
        }
        
        return cell
    }
}
