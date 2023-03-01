//
//  ViewController.swift
//  The Weather App
//
//  Created by Suraphel on 2/28/23.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate, UISearchResultsUpdating {
    
    private let searchController = UISearchController(searchResultsController: nil)
    
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchBar()
    }
    
    fileprivate func setupSearchBar() {
        definesPresentationContext = true
        navigationItem.searchController = self.searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
    }
}

