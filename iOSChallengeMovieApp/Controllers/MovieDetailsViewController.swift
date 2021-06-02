//
//  MovieDetailsController.swift
//  iOSChallengeMovieApp
//
//  Created by Muhammed Emin Aydın on 2.06.2021.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    
    // MARK: - Local variables
    fileprivate let cellId = "cellId"
    var movieResult: MovieResult!
    
    // MARK: - Views
    let backdropImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleToFill
        iv.clipsToBounds = true
        return iv
    }()
    
    let headerLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.boldSystemFont(ofSize: 24)
        lbl.adjustsFontSizeToFitWidth = true
        return lbl
    }()
    
    @objc let showCredits: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Show Actors", for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        btn.backgroundColor = UIColor.rgb(red: 229, green: 33, blue: 21)
        btn.titleLabel?.textColor = .white
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 10
        btn.tintColor = .white
        return btn
    }()
    
    let descriptionTextField: UITextView = {
        let tv = UITextView()
        tv.font = UIFont.systemFont(ofSize: 17)
        tv.isEditable = false
        tv.isSelectable = false
        return tv
    }()
    
    let voteCount: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .white
        lbl.font = UIFont.boldSystemFont(ofSize: 20)
        lbl.textAlignment = .center
        lbl.backgroundColor = UIColor.rgb(red: 155, green: 89, blue: 182, alpha: 0.7)
        lbl.layer.cornerRadius = 5
        lbl.adjustsFontSizeToFitWidth = true
        lbl.minimumScaleFactor = 0.7
        lbl.clipsToBounds = true
        return lbl
    }()
    
    let voteAverage: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .white
        lbl.font = UIFont.boldSystemFont(ofSize: 20)
        lbl.textAlignment = .center
        lbl.backgroundColor = UIColor.rgb(red: 229, green: 33, blue: 21, alpha: 0.7)
        lbl.layer.cornerRadius = 25
        lbl.clipsToBounds = true
        return lbl
    }()
    
    // MARK: — Override functions
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setViewProperties()
        showCredits.addTarget(self, action: #selector(getActorsInfo), for: .touchUpInside)
    }
    
    @objc func getActorsInfo() {
        Service.shared.fetchPersonDetail(id: movieResult.id) { res, err in
            if let err = err {
                print("Person details fetch failed...", err)
              
            }
            
            DispatchQueue.main.async {
                let personDetailVC = PersonDetailViewController()
                personDetailVC.cast = res?.cast
               
                self.navigationController?.pushViewController(personDetailVC, animated: true)
             }
        }
    }
    
    // MARK - Set views properties
    fileprivate func setViewProperties() {
        let imageUrl = Service.getImageUrl(path: movieResult.backdrop ?? "")
        backdropImageView.sd_setImage(with: URL(string: imageUrl))
        headerLabel.text = "  " + movieResult.name
        voteCount.text = "\(movieResult.voteCount)"
        voteAverage.text = "\(movieResult.voteAverage)"
        descriptionTextField.text = movieResult.description
        navigationItem.title = movieResult.name
    }
    
    // MARK: - Add views to subview
    fileprivate func setupViews() {
        // Set background color
        view.backgroundColor = .white
        
        // Change back button title
        navigationController?.navigationBar.topItem?.title = "Back"
        
        view.addSubview(backdropImageView)
        view.addSubview(showCredits)
        
        
        backdropImageView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 250)
        
        view.addSubview(voteCount)
        voteCount.anchor(top: backdropImageView.topAnchor, left: nil, bottom: nil, right: backdropImageView.rightAnchor, paddingTop: 12, paddingLeft: 0, paddingBottom: 0, paddingRight: 12, width: 100, height: 30)
        
        view.addSubview(voteAverage)
        voteAverage.anchor(top: nil, left: nil, bottom: backdropImageView.bottomAnchor, right: backdropImageView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 12, paddingRight: 12, width: 50, height: 50)
        
        view.addSubview(headerLabel)
        headerLabel.anchor(top: backdropImageView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 40)
        
        showCredits.anchor(top: backdropImageView.bottomAnchor, left: nil, bottom: nil, right: view.rightAnchor, paddingTop: 16, paddingLeft: 16, paddingBottom: 16, paddingRight: 16, width: 135, height: 30)
        
        view.addSubview(descriptionTextField)
        descriptionTextField.anchor(top: headerLabel.bottomAnchor, left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 8, paddingRight: 8, width: 0, height: 0)
    }
}

