//
//  DogsListView.swift
//  NiceDemo
//
//  Created by Serhii Kharauzov on 3/9/18.
//  Copyright © 2018 Serhii Kharauzov. All rights reserved.
//

import UIKit

class DogsListView: UIView {

    // MARK: Private properties
    
    private(set) var tableView: UITableView!
    
    // MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addTableView()
        registerTableViewCells()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Private methods
    
    private func addTableView() {
        tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = 70
        tableView.contentInset.bottom = 44.0
        addSubview(tableView)
        if #available(iOS 11.0, *) {
            NSLayoutConstraint(item: tableView, attribute: .top, relatedBy: .equal, toItem: safeAreaLayoutGuide, attribute: .top, multiplier: 1.0, constant: 0).isActive = true
        }
        else {
            NSLayoutConstraint(item: tableView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 0).isActive = true
        }
        NSLayoutConstraint(item: tableView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: tableView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: tableView, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
    }
    
    private func registerTableViewCells() {
        tableView.register(DogBreedTableViewCell.self, forCellReuseIdentifier: DogBreedTableViewCell.reuseIdentifier)
        tableView.register(LoadingTableViewCell.self, forCellReuseIdentifier: LoadingTableViewCell.reuseIdentifier)
    }
}

// MARK: DogsListView public methods

extension DogsListView {
    func reloadDataInTableView() {
        tableView.reloadData()
    }
    
    func setTableViewProvider(_ provider: TableViewProvider) {
        tableView.delegate = provider
        tableView.dataSource = provider
    }
}
