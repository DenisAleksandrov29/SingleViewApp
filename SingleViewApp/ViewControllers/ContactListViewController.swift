//
//  ViewController.swift
//  SingleViewApp
//
//  Created by Денис Александров on 04.06.2024.
//

import UIKit

class ContactListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    let dataStore = DataStore.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    // MARK: - UITableViewDataSource Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataStore.people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let person = dataStore.people[indexPath.row]
        let fullName = "\(person.firstName) \(person.lastName)"
        cell.textLabel?.text = fullName
        return cell
    }
    
    // MARK: - UITableViewDelegate Methods
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "showDetail", sender: indexPath)
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail",
           let destinationVC = segue.destination as? DetailViewController,
           let indexPath = sender as? IndexPath {
            let person = dataStore.people[indexPath.row]
            let fullName = "\(person.firstName) \(person.lastName)"
            destinationVC.fullName = fullName
            destinationVC.phone = person.phone
            destinationVC.email = person.email
        }
    }
}



