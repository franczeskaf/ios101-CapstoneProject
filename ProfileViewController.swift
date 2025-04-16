//
//  ProfileViewController.swift
//  StyleCast
//
//  Created by Franczeska Ferariza on 4/10/25.
//

import UIKit

class ProfileViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    

    // MARK: - Lifecycle
    override func viewDidLoad() {
           super.viewDidLoad()
           self.title = "Profile"
           setupUI()
           loadUserData()
       }

    // MARK: - Setup
    func setupUI() {
        // Make image circular
        profileImageView.layer.cornerRadius = profileImageView.frame.size.width / 2
        profileImageView.clipsToBounds = true
        profileImageView.layer.borderWidth = 1
        profileImageView.layer.borderColor = UIColor.lightGray.cgColor
    }

    func loadUserData() {
        // Sample data for now
        nameLabel.text = "Franczeska Ferariza"
        emailLabel.text = "franczeskaf@gmail.com"
        profileImageView.image = UIImage(named: "Profilepic") // make sure this image exists in Assets
    
    }
}
