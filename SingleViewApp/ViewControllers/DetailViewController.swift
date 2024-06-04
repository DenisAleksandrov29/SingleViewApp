//
//  DetailViewController.swift
//  SingleViewApp
//
//  Created by Денис Александров on 04.06.2024.
//

import UIKit

final class DetailViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    var fullName: String?
    var phone: String?
    var email: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let fullName = fullName {
            nameLabel.text = fullName
        }
        if let phone = phone {
            phoneLabel.text = phone
        }
        if let email = email {
            emailLabel.text = email
        }
        
        nameLabel.font = UIFont.boldSystemFont(ofSize: 24)
        phoneLabel.font = UIFont.systemFont(ofSize: 18)
        emailLabel.font = UIFont.systemFont(ofSize: 18)
    }
}
