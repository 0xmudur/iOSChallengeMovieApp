//
//  PersonVC.swift
//  iOSChallengeMovieApp
//
//  Created by Muhammed Emin Aydın on 2.06.2021.
//

import UIKit

class PersonDetailViewController: UITableViewController {
    
    var cast: [Cast]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(PersonDetailTableViewCell.self, forCellReuseIdentifier: PersonDetailTableViewCell.identifier)
        setupViews()
        
    }
    
    fileprivate func setupViews() {
        // Set background color
        view.backgroundColor = .white
        
        // Change back button title
        navigationController?.navigationBar.topItem?.title = "Back"

    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cast.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let model = cast[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: PersonDetailTableViewCell.identifier, for: indexPath) as! PersonDetailTableViewCell
        
        cell.configure(with: model)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
}
