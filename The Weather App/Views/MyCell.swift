//
//  MyCell.swift
//  The Weather App
//
//  Created by Suraphel on 3/2/23.
//

import UIKit

class MyCell: UITableViewCell {

    static let cellIdentifier = "MyTableViewCell"
    
    // create image view
    let myImageView: UIImageView = {
        let myImageView = UIImageView()
        myImageView.contentMode = .scaleAspectFit
        myImageView.clipsToBounds = true
        myImageView.translatesAutoresizingMaskIntoConstraints = false
        return myImageView
    }()
    
    // create title label
    let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20.0)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    // create subtitle label
    let subtitleLabel: UILabel = {
        let subtitleLabel = UILabel()
        subtitleLabel.font = UIFont.systemFont(ofSize: 16.0)
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        return subtitleLabel
    }()
    
    // create temperature label
    let temperatureLabel: UILabel = {
        let temperatureLabel = UILabel()
        temperatureLabel.font = UIFont.systemFont(ofSize: 20.0)
        temperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        return temperatureLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.addSubview(myImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(subtitleLabel)
        contentView.addSubview(temperatureLabel)
        applyConstraints()
    }
    
    // Add constraints
    private func applyConstraints() {
        
        NSLayoutConstraint.activate([
            myImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            myImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            myImageView.widthAnchor.constraint(equalToConstant: 50),
            myImageView.heightAnchor.constraint(equalToConstant: 50),
            
            titleLabel.leadingAnchor.constraint(equalTo: myImageView.trailingAnchor, constant: 10),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: temperatureLabel.leadingAnchor, constant: -10),
            
            subtitleLabel.leadingAnchor.constraint(equalTo: myImageView.trailingAnchor, constant: 10),
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            subtitleLabel.trailingAnchor.constraint(equalTo: temperatureLabel.leadingAnchor, constant: -10),
            
            temperatureLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            temperatureLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            temperatureLabel.widthAnchor.constraint(equalToConstant: 50),
            temperatureLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])  
    }

}
