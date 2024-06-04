//
//  ViewController.swift
//  SingleViewApp
//
//  Created by Денис Александров on 04.06.2024.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    let dataStore = DataStore.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
    }

    // MARK: - UITableViewDataSource Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataStore.firstNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let fullName = "\(dataStore.firstNames[indexPath.row]) \(dataStore.lastNames[indexPath.row])"
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
            let fullName = "\(dataStore.firstNames[indexPath.row]) \(dataStore.lastNames[indexPath.row])"
            let phone = dataStore.phones[indexPath.row]
            let email = dataStore.emails[indexPath.row]
            destinationVC.fullName = fullName
            destinationVC.phone = phone
            destinationVC.email = email
        }
    }
}



